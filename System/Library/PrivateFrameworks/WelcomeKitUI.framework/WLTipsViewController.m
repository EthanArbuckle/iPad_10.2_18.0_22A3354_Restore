@implementation WLTipsViewController

- (WLTipsViewController)initWithTips:(id)a3
{
  id v4;
  WLTipsViewController *v5;
  WLTipsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLTipsViewController;
  v5 = -[WLTipsViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[WLTipsViewController setTips:](v5, "setTips:", v4);

  return v6;
}

- (void)viewDidLoad
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
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
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
  double v55;
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
  WLTipsVideoView *v134;
  void *v135;
  objc_super v136;
  _QWORD v137[4];
  _QWORD v138[5];
  _QWORD v139[6];
  _QWORD v140[4];
  _QWORD v141[4];
  _QWORD v142[5];

  v142[3] = *MEMORY[0x24BDAC8D0];
  v136.receiver = self;
  v136.super_class = (Class)WLTipsViewController;
  -[WLTipsViewController viewDidLoad](&v136, sel_viewDidLoad);
  -[WLTips title](self->_tips, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTipsViewController setTitle:](self, "setTitle:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDF6D50]);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);
  -[WLTipsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v4);

  v7 = (void *)MEMORY[0x24BDF6AC8];
  -[WLTips image](self->_tips, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "light");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "size");
  v12 = 0.0;
  if (v13 > 0.0)
  {
    -[WLTipsViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    objc_msgSend(v11, "size");
    v18 = v16 * v17;
    objc_msgSend(v11, "size");
    v12 = v18 / v19;

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  v130 = v11;
  if (v21)
  {
    -[WLTipsViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v23;

    -[WLTipsViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v27 = v26;

    if (v24 >= v27)
      v28 = v27;
    else
      v28 = v24;
    v29 = v28 * 0.7;
    if (v12 >= v29)
      v12 = v29;
  }
  v134 = -[WLTipsVideoView initWithTips:]([WLTipsVideoView alloc], "initWithTips:", self->_tips);
  v30 = objc_alloc(MEMORY[0x24BDF6B68]);
  v31 = *MEMORY[0x24BDBF090];
  v32 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v33 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v34 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v35 = (void *)objc_msgSend(v30, "initWithFrame:", *MEMORY[0x24BDBF090], v32, v33, v34);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFont:", v36);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTextColor:", v37);

  -[WLTips title](self->_tips, "title");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setText:", v38);

  objc_msgSend(v35, "setNumberOfLines:", 0);
  objc_msgSend(v35, "sizeToFit");
  v132 = v35;
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v31, v32, v33, v34);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFont:", v40);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTextColor:", v41);

  -[WLTips desc](self->_tips, "desc");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setText:", v42);

  objc_msgSend(v39, "setNumberOfLines:", 0);
  objc_msgSend(v39, "sizeToFit");
  v133 = v39;
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v43 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v142[0] = v134;
  v142[1] = v35;
  v142[2] = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v43, "initWithArrangedSubviews:", v44);

  v131 = v45;
  objc_msgSend(v45, "setAxis:", 1);
  objc_msgSend(v45, "setAlignment:", 3);
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v45, "setLayoutMargins:", 0.0, 0.0, 50.0, 0.0);
  objc_msgSend(v45, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v4, "addSubview:", v45);
  v95 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "topAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTipsViewController view](self, "view");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintEqualToAnchor:", v115);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = v110;
  objc_msgSend(v4, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTipsViewController view](self, "view");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v98);
  v46 = v4;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v141[1] = v47;
  v135 = v46;
  objc_msgSend(v46, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTipsViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v141[2] = v51;
  objc_msgSend(v46, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTipsViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLProgressBar height](WLProgressBar, "height");
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54, -v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v141[3] = v56;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v141, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "activateConstraints:", v57);

  v106 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v131, "topAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "topAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:", v121);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = v116;
  objc_msgSend(v131, "leadingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v59;
  objc_msgSend(v131, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v140[2] = v62;
  objc_msgSend(v131, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v140[3] = v65;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v140, 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "activateConstraints:", v66);

  v96 = (void *)MEMORY[0x24BDD1628];
  -[WLTipsVideoView topAnchor](v134, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "topAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:", v122);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v117;
  -[WLTipsVideoView leadingAnchor](v134, "leadingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "leadingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v107);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v139[1] = v102;
  -[WLTipsVideoView trailingAnchor](v134, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v94);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v139[2] = v67;
  -[WLTipsVideoView widthAnchor](v134, "widthAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v139[3] = v70;
  -[WLTipsVideoView heightAnchor](v134, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToConstant:", v12);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v139[4] = v72;
  -[WLTipsVideoView bottomAnchor](v134, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, -25.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v139[5] = v75;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 6);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "activateConstraints:", v76);

  v100 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v132, "topAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTipsVideoView bottomAnchor](v134, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:constant:", v123, 25.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v118;
  objc_msgSend(v132, "leadingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "leadingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:constant:", v108, 25.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v103;
  objc_msgSend(v132, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:constant:", v77, -25.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v78;
  objc_msgSend(v132, "widthAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "widthAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, -50.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v138[3] = v81;
  objc_msgSend(v132, "bottomAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, -10.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v138[4] = v84;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 5);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "activateConstraints:", v85);

  v104 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v133, "topAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "bottomAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:constant:", v124, 10.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v119;
  objc_msgSend(v133, "leadingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v109);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v86;
  objc_msgSend(v133, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v89;
  objc_msgSend(v133, "widthAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "widthAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v137[3] = v92;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v137, 4);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "activateConstraints:", v93);

}

- (WLTips)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
  objc_storeStrong((id *)&self->_tips, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tips, 0);
}

@end
