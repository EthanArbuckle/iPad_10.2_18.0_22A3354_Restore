@implementation UIKeyboardKeyplaneSnapshotView

- (UIKeyboardKeyplaneSnapshotView)initWithKeyplaneView:(id)a3
{
  id v4;
  UIKeyboardKeyplaneSnapshotView *v5;
  UIKeyboardKeyplaneSnapshotView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  UIImageView *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  UIImageView *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ii;
  id v53;
  id *p_isa;
  id obj;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  v82.receiver = self;
  v82.super_class = (Class)UIKeyboardKeyplaneSnapshotView;
  v5 = -[UIView initWithFrame:](&v82, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    p_isa = (id *)&v5->super.super.super.isa;
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v53 = v4;
    objc_msgSend(v4, "subviews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    v10 = 0;
    if (v57)
    {
      v56 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v79 != v56)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          objc_msgSend(v12, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sublayers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v75;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v75 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                if ((objc_msgSend(v19, "isHidden") & 1) == 0)
                {
                  objc_msgSend(v19, "compositingFilter");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v20)
                  {
                    objc_msgSend(v19, "compositingFilter");
                    v21 = objc_claimAutoreleasedReturnValue();

                    v22 = v9;
                    v10 = (void *)v21;
                  }
                  else
                  {
                    v22 = v8;
                  }
                  objc_msgSend(v22, "addObject:", v19);
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
            }
            while (v16);
          }

        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      }
      while (v57);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v23 = v8;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    v4 = v53;
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v71 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * k), "setHidden:", 1);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
      }
      while (v25);
    }

    v28 = [UIImageView alloc];
    objc_msgSend(p_isa, "bounds");
    v29 = -[UIImageView initWithFrame:](v28, "initWithFrame:");
    v30 = p_isa[53];
    p_isa[53] = (id)v29;

    objc_msgSend(p_isa, "snapshotFromView:", v53);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[53], "setImage:", v31);

    objc_msgSend(p_isa[53], "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCompositingFilter:", v10);

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v33 = v23;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v67;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v67 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * m), "setHidden:", 0);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
      }
      while (v35);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v38 = v9;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v63;
      do
      {
        for (n = 0; n != v40; ++n)
        {
          if (*(_QWORD *)v63 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * n), "setHidden:", 1);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
      }
      while (v40);
    }

    v43 = [UIImageView alloc];
    objc_msgSend(p_isa, "bounds");
    v44 = -[UIImageView initWithFrame:](v43, "initWithFrame:");
    v45 = p_isa[52];
    p_isa[52] = (id)v44;

    objc_msgSend(p_isa, "snapshotFromView:", v53);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[52], "setImage:", v46);

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v47 = v38;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v59;
      do
      {
        for (ii = 0; ii != v49; ++ii)
        {
          if (*(_QWORD *)v59 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * ii), "setHidden:", 0);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v83, 16);
      }
      while (v49);
    }

    v6 = (UIKeyboardKeyplaneSnapshotView *)p_isa;
    objc_msgSend(p_isa, "addSubview:", p_isa[53]);
    -[UIView addSubview:](v6, "addSubview:", v6->_fgView);

  }
  return v6;
}

- (id)snapshotFromView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIGraphicsImageRenderer *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  UIGraphicsImageRenderer *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");

    v7 = [UIGraphicsImageRenderer alloc];
    objc_msgSend(v4, "frame");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v4, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIGraphicsImageRendererFormat formatForTraitCollection:](UIGraphicsImageRendererFormat, "formatForTraitCollection:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UIGraphicsImageRenderer initWithSize:format:](v7, "initWithSize:format:", v13, v9, v11);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__UIKeyboardKeyplaneSnapshotView_snapshotFromView___block_invoke;
    v17[3] = &unk_1E16B5018;
    v18 = v4;
    -[UIGraphicsImageRenderer imageWithActions:](v14, "imageWithActions:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __51__UIKeyboardKeyplaneSnapshotView_snapshotFromView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

- (void)setAlpha:(double)a3
{
  float v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  -[UIView layer](self->_fgView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = v4;
  objc_msgSend(v5, "setOpacity:", v6);

  -[UIView layer](self->_bgView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = v4;
  objc_msgSend(v8, "setOpacity:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_fgView, 0);
}

@end
