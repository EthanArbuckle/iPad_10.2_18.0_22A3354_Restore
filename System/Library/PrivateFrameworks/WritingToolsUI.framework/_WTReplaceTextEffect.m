@implementation _WTReplaceTextEffect

- (_WTReplaceTextEffect)initWithChunk:(id)a3 effectView:(id)a4
{
  _WTReplaceTextEffect *v4;
  uint64_t v5;
  NSArray *coolPalette;
  uint64_t v7;
  NSArray *warmPalette;
  _WTReplaceTextEffect *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_WTReplaceTextEffect;
  v4 = -[_WTTextEffect initWithChunk:effectView:](&v11, sel_initWithChunk_effectView_, a3, a4);
  if (v4)
  {
    +[_WTLightEffectPalette coolColors](_WTLightEffectPalette, "coolColors");
    v5 = objc_claimAutoreleasedReturnValue();
    coolPalette = v4->_coolPalette;
    v4->_coolPalette = (NSArray *)v5;

    +[_WTLightEffectPalette warmColors](_WTLightEffectPalette, "warmColors");
    v7 = objc_claimAutoreleasedReturnValue();
    warmPalette = v4->_warmPalette;
    v4->_warmPalette = (NSArray *)v7;

    v9 = v4;
  }

  return v4;
}

- (void)prepareWithCoolPalette:(id)a3 warmPalette:(id)a4
{
  NSArray *v6;
  NSArray *v7;
  NSArray *coolPalette;
  NSArray *warmPalette;
  NSArray *v10;

  v6 = (NSArray *)a3;
  v7 = (NSArray *)a4;
  coolPalette = self->_coolPalette;
  self->_coolPalette = v6;
  v10 = v6;

  warmPalette = self->_warmPalette;
  self->_warmPalette = v7;

}

- (void)invalidate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  BOOL v7;
  void *v8;
  void (**v9)(void);
  double v10;
  void *v11;
  double v12;
  _QWORD v13[5];
  BOOL v14;

  v3 = a3;
  -[_WTReplaceTextEffect displayLink](self, "displayLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[_WTReplaceTextEffect setDisplayLink:](self, "setDisplayLink:", 0);
  v6 = -[_WTReplaceTextEffect isDestination](self, "isDestination");
  v7 = v6;
  if (v6)
  {
    -[_WTReplaceTextEffect completion](self, "completion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_WTReplaceTextEffect completion](self, "completion");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

    }
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v10 = 0.0;
  if (v3)
    v10 = 0.25;
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", v10);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __35___WTReplaceTextEffect_invalidate___block_invoke;
  v13[3] = &unk_251C07348;
  v13[4] = self;
  v14 = v7;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v13);
  -[_WTTextEffect rootLayer](self, "rootLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 0;
  objc_msgSend(v11, "setOpacity:", v12);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)updateEffectWith:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double MinY;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
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
  double v88;
  dispatch_time_t v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  _WTReplaceTextEffect *v107;
  uint64_t v108;
  id obj;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  void *v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  void *v118;
  _QWORD block[5];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _QWORD v128[5];
  objc_super v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;
  CGRect v133;
  CGRect v134;

  v132 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v129.receiver = self;
  v129.super_class = (Class)_WTReplaceTextEffect;
  -[_WTTextEffect updateEffectWith:](&v129, sel_updateEffectWith_, v4);
  if (-[_WTTextEffect needsSetup](self, "needsSetup"))
  {
    v128[0] = MEMORY[0x24BDAC760];
    v128[1] = 3221225472;
    v128[2] = __41___WTReplaceTextEffect_updateEffectWith___block_invoke;
    v128[3] = &unk_251C07370;
    v128[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v128);
    -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
    v6 = v5;
    -[_WTTextEffect sweepDuration](self, "sweepDuration");
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect setRootLayer:](self, "setRootLayer:", v9);

    if (-[_WTReplaceTextEffect highlightsCandidateRects](self, "highlightsCandidateRects"))
    {
      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WTReplaceTextEffect setNonCandidateTextContent:](self, "setNonCandidateTextContent:", v10);

      +[_WTColor grayColor](_WTColor, "grayColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "CGColor");
      -[_WTReplaceTextEffect nonCandidateTextContent](self, "nonCandidateTextContent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v12);

      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WTReplaceTextEffect setNonCandidateTextContentMask:](self, "setNonCandidateTextContentMask:", v14);

      -[_WTReplaceTextEffect nonCandidateTextContentMask](self, "nonCandidateTextContentMask");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WTReplaceTextEffect nonCandidateTextContent](self, "nonCandidateTextContent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMask:", v15);

    }
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTReplaceTextEffect setTextContentMask:](self, "setTextContentMask:", v17);

    v113 = CACurrentMediaTime();
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v104 = v4;
    obj = v4;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
    if (v18)
    {
      v19 = v18;
      v20 = v8 * (v6 / (v6 * 3.0)) / v6;
      v21 = *(_QWORD *)v125;
      v112 = *MEMORY[0x24BDE5D28];
      v111 = *MEMORY[0x24BDE5D18];
      v22 = *MEMORY[0x24BDE5978];
      v106 = *(_QWORD *)v125;
      v107 = self;
      v105 = *MEMORY[0x24BDE5978];
      do
      {
        v23 = 0;
        v108 = v19;
        do
        {
          if (*(_QWORD *)v125 != v21)
            objc_enumerationMutation(obj);
          v115 = v23;
          v24 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v23);
          objc_msgSend(v24, "layerWithContents");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v24;
          if (-[_WTReplaceTextEffect highlightsCandidateRects](self, "highlightsCandidateRects"))
          {
            objc_msgSend(v24, "layerWithContents");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_opt_new();
            objc_msgSend(v25, "bounds");
            objc_msgSend(v26, "setFrame:");
            v27 = (void *)objc_opt_new();
            v118 = v25;
            objc_msgSend(v25, "bounds");
            objc_msgSend(v27, "setFrame:");
            v122 = 0u;
            v123 = 0u;
            v120 = 0u;
            v121 = 0u;
            objc_msgSend(v24, "candidateRects");
            v116 = (id)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
            if (v28)
            {
              v29 = v28;
              v117 = *(_QWORD *)v121;
              do
              {
                for (i = 0; i != v29; ++i)
                {
                  if (*(_QWORD *)v121 != v117)
                    objc_enumerationMutation(v116);
                  v31 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
                  v32 = (void *)objc_opt_new();
                  objc_msgSend(v26, "addSublayer:", v32);
                  objc_msgSend(v31, "platformCGRectValue");
                  objc_msgSend(v118, "convertRect:fromLayer:", v26);
                  objc_msgSend(v32, "setFrame:");
                  +[_WTColor blackColor](_WTColor, "blackColor");
                  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v32, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));

                  v34 = (void *)objc_opt_new();
                  objc_msgSend(v27, "addSublayer:", v34);
                  objc_msgSend(v31, "platformCGRectValue");
                  objc_msgSend(v118, "convertRect:fromLayer:", v27);
                  objc_msgSend(v34, "setFrame:");
                  +[_WTColor whiteColor](_WTColor, "whiteColor");
                  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v34, "setBackgroundColor:", objc_msgSend(v35, "CGColor"));

                }
                v29 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
              }
              while (v29);
            }

            v25 = v118;
            objc_msgSend(v118, "setMask:", v26);
            objc_msgSend(MEMORY[0x24BDE56D0], "layer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v110;
            objc_msgSend(v110, "bounds");
            objc_msgSend(v36, "setFrame:");
            +[_WTColor whiteColor](_WTColor, "whiteColor");
            v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v36, "setBackgroundColor:", objc_msgSend(v38, "CGColor"));

            objc_msgSend(v27, "setCompositingFilter:", CFSTR("xor"));
            objc_msgSend(v36, "addSublayer:", v27);
            objc_msgSend(v110, "setMask:", v36);
            self = v107;
            -[_WTReplaceTextEffect nonCandidateTextContentMask](v107, "nonCandidateTextContentMask");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addSublayer:", v110);

            v19 = v108;
            v22 = v105;
            v21 = v106;
          }
          else
          {
            v37 = 0;
          }
          -[_WTReplaceTextEffect textContentMask](self, "textContentMask");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addSublayer:", v25);

          objc_msgSend(v25, "position");
          v42 = v41;
          v44 = v43;
          objc_msgSend(v25, "position");
          v46 = v45;
          objc_msgSend(v25, "position");
          v48 = v47 + 12.0;
          if (-[_WTReplaceTextEffect isDestination](self, "isDestination"))
          {
            objc_msgSend(v25, "setPosition:", v46, v48);
            objc_msgSend(v37, "setPosition:", v46, v48);
            v49 = v46;
            v50 = v48;
            v48 = v44;
            v46 = v42;
          }
          else
          {
            v49 = v42;
            v50 = v44;
          }
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)MEMORY[0x24BDE56F0];
          if (-[_WTReplaceTextEffect isDestination](self, "isDestination"))
            v53 = v112;
          else
            v53 = v111;
          objc_msgSend(v52, "functionWithName:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setTimingFunction:", v54);

          objc_msgSend(MEMORY[0x24BDD1968], "valueWithPlatformCGPoint:", v49, v50);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setFromValue:", v55);

          objc_msgSend(MEMORY[0x24BDD1968], "valueWithPlatformCGPoint:", v46, v48);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setToValue:", v56);

          objc_msgSend(v51, "setDuration:", 0.25);
          if (-[_WTReplaceTextEffect isDestination](self, "isDestination"))
            v57 = 0.2;
          else
            v57 = 0.0;
          objc_msgSend(v114, "presentationFrame");
          MinY = CGRectGetMinY(v133);
          -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
          objc_msgSend(v51, "setBeginTime:", v57 + v113 + v20 * (MinY - CGRectGetMinY(v134)));
          objc_msgSend(v51, "setFillMode:", v22);
          objc_msgSend(v51, "setRemovedOnCompletion:", 0);
          objc_msgSend(v25, "addAnimation:forKey:", v51, 0);
          objc_msgSend(v37, "addAnimation:forKey:", v51, 0);

          v23 = v115 + 1;
        }
        while (v115 + 1 != v19);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
      }
      while (v19);
    }

    -[_WTTextEffect effectView](self, "effectView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "window");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "platformBackingScale");
    v62 = v61;

    objc_msgSend(MEMORY[0x24BE7EF28], "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTReplaceTextEffect setTextContent:](self, "setTextContent:", v63);

    -[_WTReplaceTextEffect textContent](self, "textContent");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setOpaque:", 0);

    -[_WTReplaceTextEffect textContent](self, "textContent");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setColorMode:", 11);

    -[_WTReplaceTextEffect textContent](self, "textContent");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setContentsScale:", v62);

    +[_WTColor grayColor](_WTColor, "grayColor");
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v68 = objc_msgSend(v67, "CGColor");
    -[_WTReplaceTextEffect textContent](self, "textContent");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setBackgroundColor:", v68);

    -[_WTReplaceTextEffect textContent](self, "textContent");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setDelegate:", self);

    objc_msgSend(MEMORY[0x24BE7EF28], "layer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTReplaceTextEffect setRootMask:](self, "setRootMask:", v71);

    -[_WTReplaceTextEffect rootMask](self, "rootMask");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setOpaque:", 0);

    -[_WTReplaceTextEffect rootMask](self, "rootMask");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setContentsScale:", v62);

    -[_WTReplaceTextEffect rootMask](self, "rootMask");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setDelegate:", self);

    -[_WTReplaceTextEffect rootMask](self, "rootMask");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setMask:", v75);

    -[_WTReplaceTextEffect textContentMask](self, "textContentMask");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTReplaceTextEffect textContent](self, "textContent");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setMask:", v77);

    -[_WTTextEffect rootLayer](self, "rootLayer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTReplaceTextEffect textContent](self, "textContent");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addSublayer:", v80);

    -[_WTTextEffect rootLayer](self, "rootLayer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTReplaceTextEffect nonCandidateTextContent](self, "nonCandidateTextContent");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addSublayer:", v82);

    -[_WTTextEffect effectView](self, "effectView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "layer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addSublayer:", v85);

    -[_WTTextEffect effectView](self, "effectView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "platformInstalledDisplayLinkWithTarget:selector:", self, sel_update_);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTReplaceTextEffect setDisplayLink:](self, "setDisplayLink:", v87);

    -[_WTTextEffect sweepDuration](self, "sweepDuration");
    v89 = dispatch_time(0, (uint64_t)(v88 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41___WTReplaceTextEffect_updateEffectWith___block_invoke_2;
    block[3] = &unk_251C07238;
    block[4] = self;
    dispatch_after(v89, MEMORY[0x24BDAC9B8], block);
    v4 = v104;
  }
  -[_WTTextEffect effectView](self, "effectView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "bounds");
  v92 = v91;
  v94 = v93;
  v96 = v95;
  v98 = v97;

  -[_WTTextEffect rootLayer](self, "rootLayer");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setFrame:", v92, v94, v96, v98);

  -[_WTReplaceTextEffect textContentMask](self, "textContentMask");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setFrame:", v92, v94, v96, v98);

  -[_WTReplaceTextEffect rootMask](self, "rootMask");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setFrame:", v92, v94, v96, v98);

  -[_WTReplaceTextEffect textContent](self, "textContent");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setFrame:", v92, v94, v96, v98);

  -[_WTReplaceTextEffect nonCandidateTextContent](self, "nonCandidateTextContent");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setFrame:", v92, v94, v96, v98);

}

- (void)update:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  -[_WTReplaceTextEffect startTime](self, "startTime", a3);
  if (v4 == 0.0)
  {
    -[_WTReplaceTextEffect displayLink](self, "displayLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    -[_WTReplaceTextEffect setStartTime:](self, "setStartTime:");

  }
  -[_WTReplaceTextEffect displayLink](self, "displayLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;
  -[_WTReplaceTextEffect startTime](self, "startTime");
  v10 = v8 - v9;

  -[_WTTextEffect sweepDuration](self, "sweepDuration");
  if (v10 > v11)
  {
    -[_WTReplaceTextEffect displayLink](self, "displayLink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

  }
  -[_WTReplaceTextEffect rootMask](self, "rootMask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsDisplay");

  -[_WTReplaceTextEffect textContent](self, "textContent");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsDisplay");

}

- (void)RBLayer:(id)a3 draw:(id)a4
{
  id v4;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MidX;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
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
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  float v59;
  uint64_t State;
  double v61;
  id v62;
  CGRect v63;
  CGRect v64;

  v62 = a3;
  v7 = a4;
  -[_WTTextEffect sweepRadius](self, "sweepRadius");
  v9 = v8;
  -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
  v11 = v10;
  v12 = v10 * 3.0;
  -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
  MidX = CGRectGetMidX(v63);
  -[_WTTextEffect effectVisibilityFrame](self, "effectVisibilityFrame");
  v14 = CGRectGetMinY(v64) - v9;
  v15 = v9 - v11;
  v16 = v9 + v12;
  -[_WTReplaceTextEffect displayLink](self, "displayLink");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timestamp");
  v19 = v18;
  -[_WTReplaceTextEffect startTime](self, "startTime");
  v21 = v20;
  -[_WTTextEffect sweepDuration](self, "sweepDuration");
  v23 = v22;

  -[_WTReplaceTextEffect textContent](self, "textContent");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24 == v62)
  {
    -[_WTReplaceTextEffect colorFillInterpolator](self, "colorFillInterpolator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v32 = (void *)objc_opt_new();
      v33 = (void *)objc_opt_new();
      v34 = (void *)objc_opt_new();
      objc_msgSend(v34, "setInfinite");
      v35 = (void *)objc_opt_new();
      v36 = -[_WTReplaceTextEffect isDestination](self, "isDestination");
      if (v36)
      {
        +[_WTColor platformTextColor](_WTColor, "platformTextColor");
        v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v4, "CGColor");
        RBColorFromCGColor();
      }
      else
      {
        LODWORD(v39) = 0.5;
        LODWORD(v40) = 1.0;
        LODWORD(v38) = 0.5;
        LODWORD(v37) = 0.5;
      }
      objc_msgSend(v35, "setColor:", v37, v38, v39, v40);
      if (v36)

      LODWORD(v41) = 1.0;
      objc_msgSend(v32, "drawShape:fill:alpha:blendMode:", v34, v35, 0, v41);
      LODWORD(v42) = 1.0;
      objc_msgSend(v33, "drawShape:fill:alpha:blendMode:", v34, v35, 0, v42);
      v43 = (void *)objc_opt_new();
      if (-[_WTReplaceTextEffect isDestination](self, "isDestination"))
      {
        +[_WTLightEffectPalette replaceDestinationColors](_WTLightEffectPalette, "replaceDestinationColors");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v43, v44, MidX, v14, v15, v9);

        LODWORD(v45) = 2.0;
        objc_msgSend(v32, "drawShape:fill:alpha:blendMode:", v34, v43, 0, v45);
        +[_WTLightEffectPalette ponderingLightEdgeDestination](_WTLightEffectPalette, "ponderingLightEdgeDestination");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v43, v46, MidX, v14, v15, v9);

        LODWORD(v47) = 1.0;
        objc_msgSend(v32, "drawShape:fill:alpha:blendMode:", v34, v43, 27, v47);
        +[_WTLightEffectPalette replaceDestinationColors](_WTLightEffectPalette, "replaceDestinationColors");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v43, v48, MidX, v14, v15, v16);

        LODWORD(v49) = 0;
        objc_msgSend(v33, "drawShape:fill:alpha:blendMode:", v34, v43, 0, v49);
        +[_WTLightEffectPalette ponderingLightEdgeDestination](_WTLightEffectPalette, "ponderingLightEdgeDestination");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v43, v50, MidX, v14, v15, v16);

        LODWORD(v51) = 1.0;
        objc_msgSend(v33, "drawShape:fill:alpha:blendMode:", v34, v43, 27, v51);
      }
      objc_msgSend(MEMORY[0x24BE7EF00], "interpolatorWithFrom:to:options:", v32, v33, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WTReplaceTextEffect setColorFillInterpolator:](self, "setColorFillInterpolator:", v52);

    }
    -[_WTReplaceTextEffect colorFillInterpolator](self, "colorFillInterpolator");
    v53 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[_WTReplaceTextEffect rootMask](self, "rootMask");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25 == v62)
  {
    -[_WTReplaceTextEffect interpolator](self, "interpolator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = (void *)objc_opt_new();
      v28 = (void *)objc_opt_new();
      v29 = (void *)objc_opt_new();
      objc_msgSend(v29, "setInfinite");
      v30 = (void *)objc_opt_new();
      if (-[_WTReplaceTextEffect isDestination](self, "isDestination"))
        +[_WTLightEffectPalette replaceDestinationSweepMask](_WTLightEffectPalette, "replaceDestinationSweepMask");
      else
        +[_WTLightEffectPalette replaceSourceSweepMask](_WTLightEffectPalette, "replaceSourceSweepMask");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v30, v54, MidX, v14, v15, v9);
      LODWORD(v55) = 1.0;
      objc_msgSend(v27, "drawShape:fill:alpha:blendMode:", v29, v30, 0, v55);
      -[_WTTextEffect _applyToFill:colors:center:startRadius:endRadius:](self, "_applyToFill:colors:center:startRadius:endRadius:", v30, v54, MidX, v14, v15, v16);
      LODWORD(v56) = 1.0;
      objc_msgSend(v28, "drawShape:fill:alpha:blendMode:", v29, v30, 0, v56);
      objc_msgSend(MEMORY[0x24BE7EF00], "interpolatorWithFrom:to:options:", v27, v28, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WTReplaceTextEffect setInterpolator:](self, "setInterpolator:", v57);

    }
    -[_WTReplaceTextEffect interpolator](self, "interpolator");
    v53 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v58 = (void *)v53;
    v59 = (v19 - v21) / v23;
    State = RBDisplayListGetState();
    *(float *)&v61 = v59;
    objc_msgSend(v58, "drawInState:by:", State, v61);

  }
}

- (id)completion
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (id)preCompletion
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setPreCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (BOOL)animateRemovalWhenDone
{
  return self->_animateRemovalWhenDone;
}

- (void)setAnimateRemovalWhenDone:(BOOL)a3
{
  self->_animateRemovalWhenDone = a3;
}

- (BOOL)isDestination
{
  return self->_isDestination;
}

- (void)setIsDestination:(BOOL)a3
{
  self->_isDestination = a3;
}

- (BOOL)highlightsCandidateRects
{
  return self->_highlightsCandidateRects;
}

- (void)setHighlightsCandidateRects:(BOOL)a3
{
  self->_highlightsCandidateRects = a3;
}

- (RBLayer)rootMask
{
  return (RBLayer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRootMask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (RBLayer)textContent
{
  return (RBLayer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTextContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (CALayer)textContentMask
{
  return (CALayer *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTextContentMask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (CALayer)nonCandidateTextContent
{
  return (CALayer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setNonCandidateTextContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (CALayer)nonCandidateTextContentMask
{
  return (CALayer *)objc_getProperty(self, a2, 192, 1);
}

- (void)setNonCandidateTextContentMask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (CADisplayLink)displayLink
{
  return (CADisplayLink *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDisplayLink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (RBDisplayListInterpolator)interpolator
{
  return (RBDisplayListInterpolator *)objc_getProperty(self, a2, 216, 1);
}

- (void)setInterpolator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (RBDisplayListInterpolator)colorFillInterpolator
{
  return (RBDisplayListInterpolator *)objc_getProperty(self, a2, 224, 1);
}

- (void)setColorFillInterpolator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSArray)coolPalette
{
  return self->_coolPalette;
}

- (NSArray)warmPalette
{
  return self->_warmPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warmPalette, 0);
  objc_storeStrong((id *)&self->_coolPalette, 0);
  objc_storeStrong((id *)&self->_colorFillInterpolator, 0);
  objc_storeStrong((id *)&self->_interpolator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_nonCandidateTextContentMask, 0);
  objc_storeStrong((id *)&self->_nonCandidateTextContent, 0);
  objc_storeStrong((id *)&self->_textContentMask, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_rootMask, 0);
  objc_storeStrong(&self->preCompletion, 0);
  objc_storeStrong(&self->completion, 0);
}

@end
