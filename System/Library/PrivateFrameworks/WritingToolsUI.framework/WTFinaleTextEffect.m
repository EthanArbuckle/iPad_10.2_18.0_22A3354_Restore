@implementation WTFinaleTextEffect

uint64_t __40___WTFinaleTextEffect_updateEffectWith___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sweep");
}

void __40___WTFinaleTextEffect_updateEffectWith___block_invoke_2(uint64_t a1)
{
  void *v2;
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  CGPath *Mutable;
  id v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  const CGPath *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
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
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v99 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "rootLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "textContentLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sublayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v94 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "removeFromSuperlayer");
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
    }
    while (v16);
  }

  Mutable = CGPathCreateMutable();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v20 = *(id *)(a1 + 40);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *MEMORY[0x24BDBF090];
    v24 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v25 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v26 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v27 = *(_QWORD *)v90;
    height = v26;
    width = v25;
    y = v24;
    x = *MEMORY[0x24BDBF090];
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v90 != v27)
          objc_enumerationMutation(v20);
        v33 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
        objc_msgSend(v33, "layerWithContents", (_QWORD)v89);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "textContentLayer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addSublayer:", v34);

        objc_msgSend(*(id *)(a1 + 40), "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33 == v36)
        {
          v47 = (const CGPath *)objc_msgSend(v33, "clippingPath");
LABEL_20:
          CGPathAddPath(Mutable, 0, v47);
          goto LABEL_22;
        }
        objc_msgSend(*(id *)(a1 + 40), "lastObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33 == v37)
        {
          CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(v33, "clippingPath"));
          v101.origin.x = x;
          v101.origin.y = y;
          v101.size.width = width;
          v101.size.height = height;
          v106.origin.x = v23;
          v106.origin.y = v24;
          v106.size.width = v25;
          v106.size.height = v26;
          if (CGRectEqualToRect(v101, v106))
            goto LABEL_22;
          v102.origin.x = x;
          v102.origin.y = y;
          v102.size.width = width;
          v102.size.height = height;
          v47 = CGPathCreateWithRect(v102, 0);
          goto LABEL_20;
        }
        v100.origin.x = x;
        v100.origin.y = y;
        v100.size.width = width;
        v100.size.height = height;
        v105.origin.x = v23;
        v105.origin.y = v24;
        v105.size.width = v25;
        v105.size.height = v26;
        v38 = CGRectEqualToRect(v100, v105);
        objc_msgSend(v33, "presentationFrame");
        v43 = v39;
        v44 = v40;
        v45 = v41;
        v46 = v42;
        if (v38)
        {
          height = v42;
          width = v41;
          y = v40;
          x = v39;
        }
        else
        {
          v103.origin.x = x;
          v103.origin.y = y;
          v103.size.width = width;
          v103.size.height = height;
          v104 = CGRectUnion(v103, *(CGRect *)&v43);
          x = v104.origin.x;
          y = v104.origin.y;
          width = v104.size.width;
          height = v104.size.height;
        }
LABEL_22:

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 32), "maskLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPath:", Mutable);

  CGPathRelease(Mutable);
  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  objc_msgSend(*(id *)(a1 + 32), "gradientHostLayer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setFrame:", v51, v53, v55, v57);

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "bounds");
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v66;
  objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bounds");
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v77 = v76;
  objc_msgSend(*(id *)(a1 + 32), "maskLayer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setFrame:", v71, v73, v75, v77);

  objc_msgSend(*(id *)(a1 + 32), "effectView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bounds");
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;
  objc_msgSend(*(id *)(a1 + 32), "textContentLayer");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);

}

void __29___WTFinaleTextEffect__sweep__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

@end
