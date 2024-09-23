@implementation UIAirDropGroupActivityCell

- (void)_installSubviewsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  id SFUIShareSheetActivityCellSpecClass;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _UIAirDropProgressView *v92;
  _UIAirDropProgressView *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;

  if (!-[UIAirDropGroupActivityCell didInstallSubviews](self, "didInstallSubviews"))
  {
    -[UIAirDropGroupActivityCell setDidInstallSubviews:](self, "setDidInstallSubviews:", 1);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
    v134 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v134, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v3);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIAirDropGroupActivityCell setVibrantTitleView:](self, "setVibrantTitleView:", v4);
    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIAirDropGroupActivityCell setPlaceholderTitleView:](self, "setPlaceholderTitleView:", v7);

    -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SHSheetUISpecPlaceholderColor(objc_msgSend(v10, "userInterfaceStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 2.0);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    -[UIAirDropGroupActivityCell _createLabelForSingleLine:](self, "_createLabelForSingleLine:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell setTextLabel:](self, "setTextLabel:", v17);

    -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    -[UIAirDropGroupActivityCell _createLabelForSingleLine:](self, "_createLabelForSingleLine:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell setTitleLabel:](self, "setTitleLabel:", v21);

    -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    -[UIAirDropGroupActivityCell _createLabelForSingleLine:](self, "_createLabelForSingleLine:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell setSubtitleLabel:](self, "setSubtitleLabel:", v25);

    -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlpha:", 0.0);

    SFUIShareSheetActivityCellSpecClass = getSFUIShareSheetActivityCellSpecClass();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(SFUIShareSheetActivityCellSpecClass, "subtitleLabelColorForIdiom:", objc_msgSend(v28, "userInterfaceIdiom"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v29);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v32);

    v33 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIAirDropGroupActivityCell setTextSlotView:](self, "setTextSlotView:", v33);

    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v38);

    v39 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIAirDropGroupActivityCell setTitleSlotView:](self, "setTitleSlotView:", v39);

    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v44);

    v45 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIAirDropGroupActivityCell setSubtitleSlotView:](self, "setSubtitleSlotView:", v45);

    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", v50);

    v51 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIAirDropGroupActivityCell setImageView:](self, "setImageView:", v51);

    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setClipsToBounds:", 1);

    -[UIAirDropGroupActivityCell circleWidth](self, "circleWidth");
    v55 = v54 * 0.5;
    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setCornerRadius:", v55);

    v58 = *MEMORY[0x1E0C9D820];
    v59 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setShadowOffset:", v58, v59);

    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setShadowRadius:", 10.0);

    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setShadowPathIsBounds:", 1);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addSubview:", v67);

    v68 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIAirDropGroupActivityCell setImageSlotView:](self, "setImageSlotView:", v68);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setAlpha:", 0.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v72 = objc_msgSend(v71, "CGColor");
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "layer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setShadowColor:", v72);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v77) = 1032805417;
    objc_msgSend(v76, "setShadowOpacity:", v77);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "layer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setShadowOffset:", v58, v59);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "layer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setShadowRadius:", 10.0);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "layer");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setShadowPathIsBounds:", 1);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "layer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "size");
    v87 = v86 * 0.5;
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "layer");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setCornerRadius:", v87);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addSubview:", v91);

    v92 = [_UIAirDropProgressView alloc];
    v93 = -[_UIAirDropProgressView initWithFrame:](v92, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_UIAirDropProgressView setProgressLineWidth:](v93, "setProgressLineWidth:", 2.0);
    -[_UIAirDropProgressView setShowProgressTray:](v93, "setShowProgressTray:", 1);
    -[_UIAirDropProgressView setAlpha:](v93, "setAlpha:", 1.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAirDropProgressView setBackgroundColor:](v93, "setBackgroundColor:", v94);

    -[_UIAirDropProgressView setTranslatesAutoresizingMaskIntoConstraints:](v93, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIAirDropGroupActivityCell setCircleProgressView:](self, "setCircleProgressView:", v93);
    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addSubview:", v93);

    v96 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIAirDropGroupActivityCell setTransportImageView:](self, "setTransportImageView:", v96);

    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v100 = objc_msgSend(v99, "CGColor");
    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "layer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setShadowColor:", v100);

    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "layer");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v105) = 1032805417;
    objc_msgSend(v104, "setShadowOpacity:", v105);

    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "layer");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setShadowOffset:", v58, v59);

    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "layer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setShadowRadius:", 5.0);

    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "layer");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setShadowPathIsBounds:", 1);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell circleProgressView](self, "circleProgressView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "insertSubview:above:", v113, v114);

    v115 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIAirDropGroupActivityCell setTransportSlotView:](self, "setTransportSlotView:", v115);

    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v118 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v119 = objc_msgSend(v118, "CGColor");
    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "layer");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setShadowColor:", v119);

    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "layer");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v124) = 1032805417;
    objc_msgSend(v123, "setShadowOpacity:", v124);

    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "layer");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setShadowOffset:", v58, v59);

    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "layer");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setShadowRadius:", 5.0);

    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "layer");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setShadowPathIsBounds:", 1);

    -[UIAirDropGroupActivityCell contentView](self, "contentView");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell circleProgressView](self, "circleProgressView");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "insertSubview:above:", v132, v133);

    -[UIAirDropGroupActivityCell _configurePlaceholderViews](self, "_configurePlaceholderViews");
    -[UIAirDropGroupActivityCell setupConstraints](self, "setupConstraints");

  }
}

- (void)_setLayoutSpec:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[UIAirDropGroupActivityCell setLayoutSpec:](self, "setLayoutSpec:", v4);
  v5 = objc_msgSend(v4, "deviceClass");
  v6 = &regularHeight5_8Rounded;
  v7 = &regularHeight;
  if (v5 == 10)
    v7 = &visionLarge;
  if (v5 == 9)
    v7 = &visionCompact;
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    v7 = &compactHeight;
  if (v5 != 3)
    v6 = v7;
  layout = (uint64_t)v6;
  objc_msgSend(v4, "peopleIconWidth");
  v9 = v8;

  self->_circleWidth = v9;
  objc_msgSend(getSFUIShareSheetActivityCellSpecClass(), "transportIconWidth");
  self->_transportIconWidth = v10;
}

- (void)configureLayoutIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[UIAirDropGroupActivityCell layoutSpec](self, "layoutSpec");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell _setLayoutSpec:](self, "_setLayoutSpec:", v12);
  if (!-[UIAirDropGroupActivityCell didInstallSubviews](self, "didInstallSubviews"))
  {
    -[UIAirDropGroupActivityCell _installSubviewsIfNeeded](self, "_installSubviewsIfNeeded");
    goto LABEL_5;
  }
  v5 = v12;
  if (v4 != v12)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[UIAirDropGroupActivityCell allConstraints](self, "allConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    -[UIAirDropGroupActivityCell circleWidth](self, "circleWidth");
    v9 = v8 * 0.5;
    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", v9);

    -[UIAirDropGroupActivityCell setupConstraints](self, "setupConstraints");
LABEL_5:
    v5 = v12;
  }

}

- (void)setupConstraints
{
  void *v3;
  double v4;
  double v5;
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
  NSString *v17;
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
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  _QWORD v314[14];
  _QWORD v315[17];
  _QWORD v316[38];

  v316[36] = *MEMORY[0x1E0C80C00];
  -[UIAirDropGroupActivityCell circleProgressView](self, "circleProgressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell contentView](self, "contentView");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell circleWidth](self, "circleWidth");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "widthAnchor");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v308, "constraintEqualToConstant:", v5);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v316[0] = v305;
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "heightAnchor");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v299, "constraintEqualToConstant:", v5);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v316[1] = v296;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v293, "widthAnchor");
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "constraintEqualToConstant:", v5);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v316[2] = v287;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v284, "heightAnchor");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "constraintEqualToConstant:", v5);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v316[3] = v278;
  -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v275, "centerXAnchor");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "centerXAnchor");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "constraintEqualToAnchor:", v266);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v316[4] = v263;
  -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v260, "centerYAnchor");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v257, "centerYAnchor");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "constraintEqualToAnchor:", v251);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v316[5] = v248;
  -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "heightAnchor");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "heightAnchor");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "constraintEqualToAnchor:", v236);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v316[6] = v233;
  -[UIAirDropGroupActivityCell vibrantTitleView](self, "vibrantTitleView");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "widthAnchor");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "widthAnchor");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "constraintEqualToAnchor:", v221);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v316[7] = v218;
  objc_msgSend(v3, "widthAnchor");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "widthAnchor");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "constraintEqualToAnchor:constant:", v209, 10.0);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v316[8] = v206;
  objc_msgSend(v3, "heightAnchor");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "heightAnchor");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "constraintEqualToAnchor:constant:", v197, 10.0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v316[9] = v194;
  objc_msgSend(v3, "centerXAnchor");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "centerXAnchor");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "constraintEqualToAnchor:", v185);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v316[10] = v182;
  v312 = v3;
  objc_msgSend(v3, "centerYAnchor");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "centerYAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "constraintEqualToAnchor:", v173);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v316[11] = v170;
  -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "centerXAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "centerXAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "constraintEqualToAnchor:", v158);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v316[12] = v155;
  -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "centerYAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "centerYAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:", v146);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v316[13] = v144;
  -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "heightAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "heightAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "constraintEqualToAnchor:", v136);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v316[14] = v134;
  -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "widthAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "widthAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:", v126);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v316[15] = v124;
  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "centerXAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "centerXAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:", v117);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v316[16] = v116;
  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "centerYAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "centerYAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v316[17] = v111;
  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "heightAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "heightAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v316[18] = v106;
  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "widthAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "widthAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v316[19] = v101;
  -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "centerXAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "centerXAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v316[20] = v96;
  -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "centerYAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "centerYAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v316[21] = v91;
  -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "heightAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "heightAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v316[22] = v86;
  -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "widthAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "widthAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v316[23] = v81;
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, 2.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v316[24] = v76;
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, 2.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v316[25] = v71;
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell transportIconWidth](self, "transportIconWidth");
  objc_msgSend(v69, "constraintEqualToConstant:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v316[26] = v68;
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "heightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell transportIconWidth](self, "transportIconWidth");
  objc_msgSend(v66, "constraintEqualToConstant:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v316[27] = v65;
  -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 2.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v316[28] = v60;
  -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 2.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v316[29] = v55;
  -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell transportIconWidth](self, "transportIconWidth");
  objc_msgSend(v53, "constraintEqualToConstant:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v316[30] = v52;
  -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell transportIconWidth](self, "transportIconWidth");
  objc_msgSend(v50, "constraintEqualToConstant:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v316[31] = v49;
  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v316[32] = v44;
  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v316[33] = v7;
  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 58.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v316[34] = v10;
  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 9.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v316[35] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v316, 36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell setAllConstraints:](self, "setAllConstraints:", v15);

  -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredContentSizeCategory");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v311) = UIContentSizeCategoryIsAccessibilityCategory(v17);

  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v309, "centerYAnchor");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "centerYAnchor");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "constraintEqualToAnchor:", v303);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v315[0] = v300;
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "leadingAnchor");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "leadingAnchor");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v294, "constraintEqualToAnchor:constant:", v291, 0.0);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v315[1] = v288;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "centerYAnchor");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "centerYAnchor");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "constraintEqualToAnchor:", v279);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v315[2] = v276;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "leadingAnchor");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "leadingAnchor");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "constraintEqualToAnchor:constant:", v267, 0.0);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v315[3] = v264;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v261, "topAnchor");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "topAnchor");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "constraintGreaterThanOrEqualToAnchor:constant:", v255, 8.0);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v315[4] = v252;
  objc_msgSend(v313, "bottomAnchor");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "bottomAnchor");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "constraintGreaterThanOrEqualToAnchor:constant:", v243, 8.0);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v315[5] = v240;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "trailingAnchor");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "trailingAnchor");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "constraintEqualToAnchor:", v231);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v315[6] = v228;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "leadingAnchor");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "trailingAnchor");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "constraintEqualToAnchor:constant:", v216, 13.0);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v315[7] = v213;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "centerYAnchor");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "centerYAnchor");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "constraintEqualToAnchor:", v201);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v315[8] = v198;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "topAnchor");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "topAnchor");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "constraintEqualToAnchor:", v186);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v315[9] = v183;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "bottomAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "centerYAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "constraintEqualToAnchor:", v171);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v315[10] = v168;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "leadingAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "leadingAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "constraintEqualToAnchor:", v156);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v315[11] = v153;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "trailingAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "trailingAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "constraintEqualToAnchor:", v145);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v315[12] = v143;
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "topAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "centerYAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "constraintEqualToAnchor:", v135);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v315[13] = v133;
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "bottomAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "bottomAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:", v125);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v315[14] = v123;
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "leadingAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v315[15] = v20;
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v315[16] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v315, 17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell setLargeTextConstraints:](self, "setLargeTextConstraints:", v26);

  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v310, "topAnchor");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "topAnchor");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "constraintEqualToAnchor:constant:", v304, *(double *)layout);
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v314[0] = v301;
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v298, "centerXAnchor");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "centerXAnchor");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "constraintEqualToAnchor:", v292);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v314[1] = v289;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "topAnchor");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v283, "topAnchor");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "constraintEqualToAnchor:", v277);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v314[2] = v274;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "centerXAnchor");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "centerXAnchor");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "constraintEqualToAnchor:", v262);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v314[3] = v259;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "topAnchor");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v253, "bottomAnchor");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "constraintEqualToAnchor:constant:", v247, *(double *)(layout + 8));
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v314[4] = v244;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "bottomAnchor");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "bottomAnchor");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "constraintLessThanOrEqualToAnchor:constant:", v235, *(double *)(layout + 16));
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v314[5] = v232;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "widthAnchor");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "widthAnchor");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "constraintEqualToAnchor:constant:", v223, *(double *)(layout + 24));
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v314[6] = v220;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "centerXAnchor");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "centerXAnchor");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v214, "constraintEqualToAnchor:", v211);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v314[7] = v208;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "topAnchor");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "bottomAnchor");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "constraintEqualToAnchor:constant:", v196, *(double *)(layout + 8));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v314[8] = v193;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "widthAnchor");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "widthAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "constraintEqualToAnchor:constant:", v184, *(double *)(layout + 24));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v314[9] = v181;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "centerXAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "centerXAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "constraintEqualToAnchor:", v172);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v314[10] = v169;
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "topAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "bottomAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "constraintEqualToAnchor:", v157);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v314[11] = v154;
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, *(double *)(layout + 24));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v314[12] = v30;
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v314[13] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v314, 14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell setRegularConstraints:](self, "setRegularConstraints:", v35);

  -[UIAirDropGroupActivityCell allConstraints](self, "allConstraints");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v311)
    -[UIAirDropGroupActivityCell largeTextConstraints](self, "largeTextConstraints");
  else
    -[UIAirDropGroupActivityCell regularConstraints](self, "regularConstraints");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v37);

  v38 = (void *)MEMORY[0x1E0CB3718];
  -[UIAirDropGroupActivityCell allConstraints](self, "allConstraints");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v39);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIAirDropGroupActivityCell;
  v4 = a3;
  -[UIAirDropGroupActivityCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[UIAirDropGroupActivityCell _updateConstraints](self, "_updateConstraints");
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  void *v6;
  _QWORD v7[4];
  id v8[2];
  BOOL v9;
  id location;

  self->_progress = a3;
  location = 0;
  objc_initWeak(&location, self);
  v6 = (void *)*MEMORY[0x1E0DC4730];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__UIAirDropGroupActivityCell_setProgress_animated___block_invoke;
  v7[3] = &unk_1E4001678;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  v9 = a4;
  objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __51__UIAirDropGroupActivityCell_setProgress_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateProgress:animated:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));

}

- (void)_updateProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11[2];
  char v12;
  id location;

  v4 = a4;
  v7 = -[UIAirDropGroupActivityCell stateBeingRestored](self, "stateBeingRestored");
  location = 0;
  objc_initWeak(&location, self);
  -[UIAirDropGroupActivityCell circleProgressView](self, "circleProgressView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4 & ~v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__UIAirDropGroupActivityCell__updateProgress_animated___block_invoke;
  v10[3] = &unk_1E4001678;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  v12 = v9;
  objc_msgSend(v8, "setProgress:animated:completion:", v9, v10, a3);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __55__UIAirDropGroupActivityCell__updateProgress_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didCompleteAirDropProgress:animated:", *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));

}

- (void)_didCompleteAirDropProgress:(double)a3 animated:(BOOL)a4
{
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (a3 >= 1.0 || a3 == 0.0)
  {
    if (a4)
    {
      location = 0;
      objc_initWeak(&location, self);
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __67__UIAirDropGroupActivityCell__didCompleteAirDropProgress_animated___block_invoke;
      v11[3] = &unk_1E40016A0;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v9, "animateWithDuration:animations:", v11, 0.5);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      return;
    }
    -[UIAirDropGroupActivityCell circleProgressView](self, "circleProgressView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    goto LABEL_8;
  }
  -[UIAirDropGroupActivityCell progress](self, "progress", a4);
  v6 = v5;
  -[UIAirDropGroupActivityCell circleProgressView](self, "circleProgressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v6 <= 0.0)
  {
LABEL_8:
    v8 = 0.0;
    goto LABEL_9;
  }
  v8 = 1.0;
LABEL_9:
  objc_msgSend(v7, "setAlpha:", v8);

}

void __67__UIAirDropGroupActivityCell__didCompleteAirDropProgress_animated___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "circleProgressView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)startPulsing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (!-[UIAirDropGroupActivityCell isPulsing](self, "isPulsing"))
  {
    -[UIAirDropGroupActivityCell setIsPulsing:](self, "setIsPulsing:", 1);
    -[UIAirDropGroupActivityCell subtitle](self, "subtitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
    else
      -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setAlpha:", 1.0);
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__UIAirDropGroupActivityCell_startPulsing__block_invoke;
    v7[3] = &unk_1E4001608;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 24, v7, 0, 0.75, 0.0);

  }
}

uint64_t __42__UIAirDropGroupActivityCell_startPulsing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.2);
}

- (void)stopPulsing
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  if (-[UIAirDropGroupActivityCell isPulsing](self, "isPulsing"))
  {
    -[UIAirDropGroupActivityCell setIsPulsing:](self, "setIsPulsing:", 0);
    -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeAllAnimations:", 1);

    -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    v6 = v5;

    if (v6 > 0.0)
    {
      -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

    }
    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllAnimations");

    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alpha");
    v12 = v11;

    if (v12 > 0.0)
    {
      -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", 1.0);

    }
  }
}

- (id)createTargetedPreview
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (-[UIAirDropGroupActivityCell imageSlotID](self, "imageSlotID"))
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  else
    -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(v5, "setVisiblePath:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v3, v5);

  return v6;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIAirDropGroupActivityCell;
  -[UIAirDropGroupActivityCell prepareForReuse](&v5, sel_prepareForReuse);
  -[UIAirDropGroupActivityCell setDisplayName:](self, "setDisplayName:", 0);
  -[UIAirDropGroupActivityCell setTextSlotID:](self, "setTextSlotID:", 0);
  -[UIAirDropGroupActivityCell setSubtitle:](self, "setSubtitle:", 0);
  -[UIAirDropGroupActivityCell setSubtitleSlotID:](self, "setSubtitleSlotID:", 0);
  -[UIAirDropGroupActivityCell setImage:](self, "setImage:", 0);
  -[UIAirDropGroupActivityCell setImageSlotID:](self, "setImageSlotID:", 0);
  -[UIAirDropGroupActivityCell setTransportImage:](self, "setTransportImage:", 0);
  -[UIAirDropGroupActivityCell setTransportSlotID:](self, "setTransportSlotID:", 0);
  -[UIAirDropGroupActivityCell setSquareImage:](self, "setSquareImage:", 0);
  -[UIAirDropGroupActivityCell setDisabled:](self, "setDisabled:", 0);
  -[UIAirDropGroupActivityCell setIsGroup:](self, "setIsGroup:", 0);
  -[UIAirDropGroupActivityCell _configurePlaceholderViews](self, "_configurePlaceholderViews");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  -[UIAirDropGroupActivityCell stopPulsing](self, "stopPulsing");
}

- (id)_placeholderStringForSingleLine:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  __CFString *v7;

  if (a3)
  {
    v3 = CFSTR("Apple");
  }
  else
  {
    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    v7 = CFSTR("Apple\nInc");
    if (IsAccessibilityCategory)
      v7 = CFSTR("Apple\nInc\n");
    v3 = v7;
  }
  return v3;
}

- (id)_labelFont
{
  void *v2;
  id SFUIShareSheetActivityCellSpecClass;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC37E8];
  SFUIShareSheetActivityCellSpecClass = getSFUIShareSheetActivityCellSpecClass();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SFUIShareSheetActivityCellSpecClass, "titleLabelFontTextStyleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_createLabelForSingleLine:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  -[UIAirDropGroupActivityCell _placeholderStringForSingleLine:](self, "_placeholderStringForSingleLine:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UIAirDropGroupActivityCell _labelFont](self, "_labelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_msgSend(v6, "setTextAlignment:", 1);
  if (v3)
    v9 = 1;
  else
    v9 = 3;
  objc_msgSend(v6, "setNumberOfLines:", v9);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setText:", v5);
  objc_msgSend(v6, "setAlpha:", 0.0);

  return v6;
}

- (void)_updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[UIAirDropGroupActivityCell _labelFont](self, "_labelFont");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v14);

  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v14);

  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v14);

  -[UIAirDropGroupActivityCell _invalidateDisplayName](self, "_invalidateDisplayName");
  -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  v9 = (void *)MEMORY[0x1E0CB3718];
  if (IsAccessibilityCategory)
  {
    -[UIAirDropGroupActivityCell regularConstraints](self, "regularConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[UIAirDropGroupActivityCell largeTextConstraints](self, "largeTextConstraints");
  }
  else
  {
    -[UIAirDropGroupActivityCell largeTextConstraints](self, "largeTextConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v12);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[UIAirDropGroupActivityCell regularConstraints](self, "regularConstraints");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v13);

  -[UIAirDropGroupActivityCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFormattedDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  BOOL IsAccessibilityCategory;
  void *v11;
  BOOL v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double height;
  void *v28;
  double v29;
  float v30;
  uint64_t v31;
  NSString *formattedDisplayName;
  void *v33;
  _QWORD v34[3];
  _QWORD v35[4];
  CGRect v36;
  CGRect v37;

  v35[3] = *MEMORY[0x1E0C80C00];
  -[UIAirDropGroupActivityCell displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  -[UIAirDropGroupActivityCell subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = 1;
  else
    v12 = -[UIAirDropGroupActivityCell isGroup](self, "isGroup");

  if (!IsAccessibilityCategory)
  {
    v13 = objc_msgSend(v7, "count") != 2 || v12;
    if ((v13 & 1) != 0)
    {
      -[UIAirDropGroupActivityCell displayName](self, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SFNonBreakingStringFromDeviceName();
      v15 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v15;
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
      objc_msgSend(v16, "setLineBreakMode:", 0);
      LODWORD(v17) = 0;
      objc_msgSend(v16, "setHyphenationFactor:", v17);
      objc_msgSend(v16, "setLineBreakStrategy:", 0xFFFFLL);
      objc_msgSend(v16, "setAlignment:", 1);
      v34[0] = *MEMORY[0x1E0DC32A8];
      objc_msgSend(v4, "textColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v18;
      v34[1] = *MEMORY[0x1E0DC32A0];
      objc_msgSend(v4, "font");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v19;
      v34[2] = *MEMORY[0x1E0DC32C0];
      v20 = (void *)objc_msgSend(v16, "copy");
      v35[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "length") && objc_msgSend(v23, "length"))
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v22, v21);
        objc_msgSend(v4, "frame");
        v33 = v24;
        objc_msgSend(v24, "boundingRectWithSize:options:context:", 35, 0, v25, v26);
        v37 = CGRectIntegral(v36);
        height = v37.size.height;
        objc_msgSend(v4, "font", v37.origin.x, v37.origin.y, v37.size.width);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lineHeight");
        *(float *)&v29 = v29;
        LODWORD(v24) = llroundf(*(float *)&v29);

        v30 = height;
        if ((int)llroundf(v30) / (int)v24 == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v22, v23);
          v31 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v31;
        }

      }
    }
  }
  formattedDisplayName = self->_formattedDisplayName;
  self->_formattedDisplayName = (NSString *)v3;

}

- (void)setDisplayName:(id)a3
{
  id v4;
  NSString *displayName;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  displayName = self->_displayName;
  v10 = (NSString *)v4;
  v6 = displayName;
  if (v6 == v10)
  {

  }
  else
  {
    if ((v10 == 0) != (v6 != 0))
    {
      v7 = -[NSString isEqual:](v10, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_displayName;
    self->_displayName = v8;

    -[UIAirDropGroupActivityCell _invalidateDisplayName](self, "_invalidateDisplayName");
  }
LABEL_8:

}

- (void)setTextSlotID:(unsigned int)a3
{
  if (self->_textSlotID != a3)
  {
    self->_textSlotID = a3;
    -[UIAirDropGroupActivityCell _invalidateDisplayName](self, "_invalidateDisplayName");
  }
}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *subtitle;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  subtitle = self->_subtitle;
  v10 = (NSString *)v4;
  v6 = subtitle;
  if (v6 == v10)
  {

  }
  else
  {
    if ((v10 == 0) != (v6 != 0))
    {
      v7 = -[NSString isEqual:](v10, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_subtitle;
    self->_subtitle = v8;

    -[UIAirDropGroupActivityCell _invalidateSubtitle](self, "_invalidateSubtitle");
  }
LABEL_8:

}

- (void)setSubtitleSlotID:(unsigned int)a3
{
  if (self->_subtitleSlotID != a3)
  {
    self->_subtitleSlotID = a3;
    -[UIAirDropGroupActivityCell _invalidateSubtitle](self, "_invalidateSubtitle");
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[UIAirDropGroupActivityCell _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)setImageSlotID:(unsigned int)a3
{
  if (self->_imageSlotID != a3)
  {
    self->_imageSlotID = a3;
    -[UIAirDropGroupActivityCell _updateImageView](self, "_updateImageView");
  }
}

- (void)setTransportImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_transportImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_transportImage, a3);
    -[UIAirDropGroupActivityCell _updateTransportView](self, "_updateTransportView");
    v5 = v6;
  }

}

- (void)setTransportSlotID:(unsigned int)a3
{
  if (self->_transportSlotID != a3)
  {
    self->_transportSlotID = a3;
    -[UIAirDropGroupActivityCell _updateTransportView](self, "_updateTransportView");
  }
}

- (void)setSquareImage:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CGRect v11;

  if (self->_squareImage != a3)
  {
    v4 = a3;
    self->_squareImage = a3;
    if (a3)
    {
      -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      v6 = CGRectGetWidth(v11) * 0.5;
    }
    else
    {
      v6 = 0.0;
    }
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v6);

    if (v4)
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", v4);

  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_disabled != a3)
  {
    v3 = a3;
    self->_disabled = a3;
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[UIAirDropGroupActivityCell identifier](self, "identifier");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = "no";
      if (v3)
        v8 = "yes";
      v9 = 138412546;
      v10 = v6;
      v11 = 2080;
      v12 = v8;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Updating People Cell with identifier:%@ to disabled:%s", (uint8_t *)&v9, 0x16u);

    }
    -[UIAirDropGroupActivityCell _updateDarkening](self, "_updateDarkening");
  }
}

- (void)setSubtitleTextColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = v7;
  if (!v7)
  {

    v6 = 0;
  }

}

- (void)setIsGroup:(BOOL)a3
{
  if (self->_isGroup != a3)
  {
    self->_isGroup = a3;
    -[UIAirDropGroupActivityCell _invalidateDisplayName](self, "_invalidateDisplayName");
  }
}

- (void)_invalidateDisplayName
{
  void *v3;
  unsigned int v4;

  -[UIAirDropGroupActivityCell _updateFormattedDisplayName](self, "_updateFormattedDisplayName");
  -[UIAirDropGroupActivityCell subtitle](self, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {

LABEL_4:
    -[UIAirDropGroupActivityCell _updateTitleView](self, "_updateTitleView");
    return;
  }
  v4 = -[UIAirDropGroupActivityCell subtitleSlotID](self, "subtitleSlotID");

  if (v4)
    goto LABEL_4;
  -[UIAirDropGroupActivityCell _updateTextView](self, "_updateTextView");
}

- (void)_invalidateSubtitle
{
  -[UIAirDropGroupActivityCell _invalidateDisplayName](self, "_invalidateDisplayName");
  -[UIAirDropGroupActivityCell _updateSubtitleView](self, "_updateSubtitleView");
}

- (void)_configurePlaceholderViews
{
  void *v3;

  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[UIAirDropGroupActivityCell _configureImageViewForPlaceholder:](self, "_configureImageViewForPlaceholder:", 1);
}

- (void)_configureImageViewForPlaceholder:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v4 = a3;
  if (a3)
  {
    v6 = 1.0;
  }
  else
  {
    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v6 = v7;
  }
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v6);

  if (v4)
  {
    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SHSheetUISpecPlaceholderColor(objc_msgSend(v12, "userInterfaceStyle"));
  }
  else
  {

    -[UIAirDropGroupActivityCell imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1032805417;
    objc_msgSend(v13, "setShadowOpacity:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  if (v4)
  {

    v16 = v12;
  }

}

- (void)_updateTextView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[UIAirDropGroupActivityCell formattedDisplayName](self, "formattedDisplayName");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v37, "length");
  v5 = v37;
  if (!v4)
  {
    -[UIAirDropGroupActivityCell _placeholderStringForSingleLine:](self, "_placeholderStringForSingleLine:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v4)
  {
    v7 = 1.0;
  }
  else
  {

    v7 = 0.0;
  }
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = -[UIAirDropGroupActivityCell textSlotID](self, "textSlotID");
  if (v9)
  {
    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "layoutDirection");

    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    v15 = (id *)MEMORY[0x1E0CD2FA0];
    if (v11 != 1)
      v15 = (id *)MEMORY[0x1E0CD2F80];
    v16 = (void *)MEMORY[0x1E0CD2720];
    v17 = *v15;
    objc_msgSend(v16, "objectForSlot:", -[UIAirDropGroupActivityCell textSlotID](self, "textSlotID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 1.0);

    v20 = _ShareSheetDeviceScreenScale();
    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentsScale:", v20);

    v23 = _ShareSheetDeviceScreenScale();
    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRasterizationScale:", v23);

    if (IsAccessibilityCategory)
      v26 = v17;
    else
      v26 = (id)*MEMORY[0x1E0CD2F60];
    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentsGravity:", v26);

    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContents:", v18);

  }
  else
  {
    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContents:", 0);
  }

  if (v9)
    v31 = 1.0;
  else
    v31 = 0.0;
  -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAlpha:", v31);

  if (v4 || v9)
  {
    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell _placeholderStringForSingleLine:](self, "_placeholderStringForSingleLine:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v35);

  }
}

- (void)_updateTitleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  _BOOL4 IsAccessibilityCategory;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[UIAirDropGroupActivityCell formattedDisplayName](self, "formattedDisplayName");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v40, "length");
  v5 = v40;
  if (!v4)
  {
    -[UIAirDropGroupActivityCell _placeholderStringForSingleLine:](self, "_placeholderStringForSingleLine:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v4)
  {
    v7 = 1.0;
  }
  else
  {

    v7 = 0.0;
  }
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  if (-[UIAirDropGroupActivityCell isGroup](self, "isGroup"))
    v9 = 0.8;
  else
    v9 = 0.0;
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumScaleFactor:", v9);

  v11 = -[UIAirDropGroupActivityCell isGroup](self, "isGroup");
  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", v11);

  v13 = -[UIAirDropGroupActivityCell textSlotID](self, "textSlotID");
  if (v13)
  {
    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "layoutDirection");

    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    v19 = (id *)MEMORY[0x1E0CD2FA0];
    if (v15 != 1)
      v19 = (id *)MEMORY[0x1E0CD2F80];
    v20 = (void *)MEMORY[0x1E0CD2720];
    v21 = *v19;
    objc_msgSend(v20, "objectForSlot:", -[UIAirDropGroupActivityCell textSlotID](self, "textSlotID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = _ShareSheetDeviceScreenScale();
    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContentsScale:", v23);

    v26 = _ShareSheetDeviceScreenScale();
    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setRasterizationScale:", v26);

    if (IsAccessibilityCategory)
      v29 = v21;
    else
      v29 = (id)*MEMORY[0x1E0CD2F60];
    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setContentsGravity:", v29);

    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setContents:", v22);

  }
  else
  {
    -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setContents:", 0);
  }

  if (v13)
    v34 = 1.0;
  else
    v34 = 0.0;
  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", v34);

  if (v4 || v13)
  {
    -[UIAirDropGroupActivityCell textSlotView](self, "textSlotView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAlpha:", 0.0);

    -[UIAirDropGroupActivityCell _placeholderStringForSingleLine:](self, "_placeholderStringForSingleLine:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v38);

  }
}

- (void)_updateSubtitleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;

  -[UIAirDropGroupActivityCell placeholderTitleView](self, "placeholderTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[UIAirDropGroupActivityCell subtitle](self, "subtitle");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v32, "length");
  v5 = v32;
  if (!v4)
  {
    -[UIAirDropGroupActivityCell _placeholderStringForSingleLine:](self, "_placeholderStringForSingleLine:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v4)
  {
    v7 = 1.0;
  }
  else
  {

    v7 = 0.0;
  }
  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = -[UIAirDropGroupActivityCell subtitleSlotID](self, "subtitleSlotID");
  if (v9)
  {
    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "layoutDirection");

    -[UIAirDropGroupActivityCell traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    v15 = (id *)MEMORY[0x1E0CD2F70];
    if (v11 != 1)
      v15 = (id *)MEMORY[0x1E0CD2F68];
    v16 = (void *)MEMORY[0x1E0CD2720];
    v17 = *v15;
    objc_msgSend(v16, "objectForSlot:", -[UIAirDropGroupActivityCell subtitleSlotID](self, "subtitleSlotID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _ShareSheetDeviceScreenScale();
    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentsScale:", v19);

    v22 = _ShareSheetDeviceScreenScale();
    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRasterizationScale:", v22);

    if (IsAccessibilityCategory)
      v25 = v17;
    else
      v25 = (id)*MEMORY[0x1E0CD2F60];
    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContentsGravity:", v25);

    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContents:", v18);

  }
  else
  {
    -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContents:", 0);
  }

  if (v9)
    v30 = 1.0;
  else
    v30 = 0.0;
  -[UIAirDropGroupActivityCell subtitleSlotView](self, "subtitleSlotView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlpha:", v30);

}

- (void)_updateImageView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  CGRect v24;

  -[UIAirDropGroupActivityCell _configureImageViewForPlaceholder:](self, "_configureImageViewForPlaceholder:", 0);
  -[UIAirDropGroupActivityCell image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  v6 = 0.0;
  if (v3)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[UIAirDropGroupActivityCell imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = -[UIAirDropGroupActivityCell imageSlotID](self, "imageSlotID");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", -[UIAirDropGroupActivityCell imageSlotID](self, "imageSlotID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CD2F88];
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentsGravity:", v11);

    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContents:", v10);

    v16 = -[UIAirDropGroupActivityCell isSquareImage](self, "isSquareImage");
    if (v16)
    {
      -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v6 = CGRectGetWidth(v24) * 0.5;
    }
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", v6);

    if (v16)
    v19 = -[UIAirDropGroupActivityCell isSquareImage](self, "isSquareImage");
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMasksToBounds:", v19);

  }
  else
  {
    -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContents:", 0);
  }

  if (v9)
    v22 = 1.0;
  else
    v22 = 0.0;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", v22);

}

- (void)_updateTransportView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;

  -[UIAirDropGroupActivityCell transportImage](self, "transportImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell transportImage](self, "transportImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  if (v3)
    v6 = 1.0;
  else
    v6 = 0.0;
  -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  v8 = -[UIAirDropGroupActivityCell transportSlotID](self, "transportSlotID");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", -[UIAirDropGroupActivityCell transportSlotID](self, "transportSlotID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CD2F88];
    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentsGravity:", v10);

    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContents:", v9);

  }
  else
  {
    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContents:", 0);
  }

  if (v8)
    v15 = 1.0;
  else
    v15 = 0.0;
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", v15);

}

- (void)_updateDarkening
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
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContents:", v29);

  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:", v7);

  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContents:", v10);

  if ((-[UIAirDropGroupActivityCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[UIAirDropGroupActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v15, "CGColor");
    v18 = 1;
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentsMultiplyColor:", v17);

  if (v18)
  if ((-[UIAirDropGroupActivityCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[UIAirDropGroupActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v15, "CGColor");
    v22 = 1;
  }
  else
  {
    v22 = 0;
    v21 = 0;
  }
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentsMultiplyColor:", v21);

  if (v22)
  v25 = -[UIAirDropGroupActivityCell isDisabled](self, "isDisabled") ^ 1;
  -[UIAirDropGroupActivityCell textLabel](self, "textLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEnabled:", v25);

  -[UIAirDropGroupActivityCell titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setEnabled:", v25);

  -[UIAirDropGroupActivityCell subtitleLabel](self, "subtitleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEnabled:", v25);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIAirDropGroupActivityCell isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAirDropGroupActivityCell;
    -[UIAirDropGroupActivityCell setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[UIAirDropGroupActivityCell _updateDarkening](self, "_updateDarkening");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
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
  objc_super v20;

  v3 = a3;
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)UIAirDropGroupActivityCell;
  -[UIAirDropGroupActivityCell setSelected:](&v20, sel_setSelected_, v3);
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContents:", v7);

  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContents:", v10);

  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContents:", v13);

}

- (void)setTransportIconHidden:(BOOL)a3 animated:(BOOL)a4 useDelay:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  _QWORD v17[4];
  id v18;
  _BOOL8 v19;
  _QWORD v20[4];
  id v21;
  _BOOL8 v22;

  v5 = a5;
  v6 = a4;
  v8 = !a3;
  if (-[UIAirDropGroupActivityCell transportSlotID](self, "transportSlotID"))
    -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  else
    -[UIAirDropGroupActivityCell transportImageView](self, "transportImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    if (v5)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke;
      v20[3] = &unk_1E40016C8;
      v21 = v9;
      v22 = v8;
      objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 196608, v20, 0, 0.200000003, 0.6);
      v12 = v21;
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke_2;
      v17[3] = &unk_1E40016C8;
      v18 = v9;
      v19 = v8;
      objc_msgSend(v11, "animateWithDuration:animations:", v17, 0.200000003);
      v12 = v18;
    }

  }
  else
  {
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v15.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformScale(&v16, &v15, (double)v8, (double)v8);
    v14 = v16;
    objc_msgSend(v10, "setTransform:", &v14);
  }

}

uint64_t __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke(uint64_t a1)
{
  CGFloat v2;
  __int128 v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v2 = (double)*(uint64_t *)(a1 + 40);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v8, &v7, v2, v2);
  v4 = *(void **)(a1 + 32);
  v6 = v8;
  return objc_msgSend(v4, "setTransform:", &v6);
}

uint64_t __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke_2(uint64_t a1)
{
  CGFloat v2;
  __int128 v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v2 = (double)*(uint64_t *)(a1 + 40);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v8, &v7, v2, v2);
  v4 = *(void **)(a1 + 32);
  v6 = v8;
  return objc_msgSend(v4, "setTransform:", &v6);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UIAirDropNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unsigned)textSlotID
{
  return self->_textSlotID;
}

- (unsigned)subtitleSlotID
{
  return self->_subtitleSlotID;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIImage)image
{
  return self->_image;
}

- (unsigned)imageSlotID
{
  return self->_imageSlotID;
}

- (UIImage)transportImage
{
  return self->_transportImage;
}

- (unsigned)transportSlotID
{
  return self->_transportSlotID;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (BOOL)stateBeingRestored
{
  return self->_stateBeingRestored;
}

- (void)setStateBeingRestored:(BOOL)a3
{
  self->_stateBeingRestored = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isSquareImage
{
  return self->_squareImage;
}

- (BOOL)isLongPressable
{
  return self->_longPressable;
}

- (void)setLongPressable:(BOOL)a3
{
  self->_longPressable = a3;
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (void)setIsPulsing:(BOOL)a3
{
  self->_isPulsing = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)didInstallSubviews
{
  return self->_didInstallSubviews;
}

- (void)setDidInstallSubviews:(BOOL)a3
{
  self->_didInstallSubviews = a3;
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  return (SHSheetContentLayoutSpec *)objc_loadWeakRetained((id *)&self->_layoutSpec);
}

- (void)setLayoutSpec:(id)a3
{
  objc_storeWeak((id *)&self->_layoutSpec, a3);
}

- (UIVisualEffectView)vibrantTitleView
{
  return self->_vibrantTitleView;
}

- (void)setVibrantTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantTitleView, a3);
}

- (UIVisualEffectView)vibrantSubtitleView
{
  return self->_vibrantSubtitleView;
}

- (void)setVibrantSubtitleView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantSubtitleView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)imageSlotView
{
  return self->_imageSlotView;
}

- (void)setImageSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_imageSlotView, a3);
}

- (UIImageView)transportImageView
{
  return self->_transportImageView;
}

- (void)setTransportImageView:(id)a3
{
  objc_storeStrong((id *)&self->_transportImageView, a3);
}

- (UIView)transportSlotView
{
  return self->_transportSlotView;
}

- (void)setTransportSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_transportSlotView, a3);
}

- (UIView)placeholderTitleView
{
  return self->_placeholderTitleView;
}

- (void)setPlaceholderTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTitleView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIView)textSlotView
{
  return self->_textSlotView;
}

- (void)setTextSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_textSlotView, a3);
}

- (UIView)titleSlotView
{
  return self->_titleSlotView;
}

- (void)setTitleSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_titleSlotView, a3);
}

- (UIView)subtitleSlotView
{
  return self->_subtitleSlotView;
}

- (void)setSubtitleSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleSlotView, a3);
}

- (NSArray)subtitleLabelVisibleConstraintsArray
{
  return self->_subtitleLabelVisibleConstraintsArray;
}

- (void)setSubtitleLabelVisibleConstraintsArray:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabelVisibleConstraintsArray, a3);
}

- (_UIAirDropProgressView)circleProgressView
{
  return self->_circleProgressView;
}

- (void)setCircleProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_circleProgressView, a3);
}

- (NSMutableArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_allConstraints, a3);
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularConstraints, a3);
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextConstraints, a3);
}

- (double)circleWidth
{
  return self->_circleWidth;
}

- (double)transportIconWidth
{
  return self->_transportIconWidth;
}

- (NSString)formattedDisplayName
{
  return self->_formattedDisplayName;
}

- (void)setFormattedDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_formattedDisplayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedDisplayName, 0);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_circleProgressView, 0);
  objc_storeStrong((id *)&self->_subtitleLabelVisibleConstraintsArray, 0);
  objc_storeStrong((id *)&self->_subtitleSlotView, 0);
  objc_storeStrong((id *)&self->_titleSlotView, 0);
  objc_storeStrong((id *)&self->_textSlotView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_placeholderTitleView, 0);
  objc_storeStrong((id *)&self->_transportSlotView, 0);
  objc_storeStrong((id *)&self->_transportImageView, 0);
  objc_storeStrong((id *)&self->_imageSlotView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_vibrantSubtitleView, 0);
  objc_storeStrong((id *)&self->_vibrantTitleView, 0);
  objc_destroyWeak((id *)&self->_layoutSpec);
  objc_storeStrong((id *)&self->_transportImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
