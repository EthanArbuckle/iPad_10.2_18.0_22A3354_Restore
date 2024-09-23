@implementation UIStatusBarRegionAxisCenteringLayout

void __102___UIStatusBarRegionAxisCenteringLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  UILayoutGuide *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;

  v84 = a2;
  objc_msgSend(v84, "layoutItem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!a3)
  {
    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 96);
    v22 = *(id *)(a1 + 40);
    v23 = v22;
    if (v21 == 1)
    {
      objc_msgSend(v22, "topAnchor");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v21)
        goto LABEL_35;
      objc_msgSend(v22, "leadingAnchor");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v24;
LABEL_35:

    v47 = *(_QWORD *)(a1 + 96);
    v48 = *(id *)(a1 + 48);
    v49 = v48;
    if (v47 == 1)
    {
      objc_msgSend(v48, "topAnchor");
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v47)
        goto LABEL_40;
      objc_msgSend(v48, "leadingAnchor");
      v50 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v50;
LABEL_40:

    objc_msgSend(v3, "constraintEqualToAnchor:", v23);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v51);

    v52 = *(void **)(a1 + 32);
    v53 = *(_QWORD *)(a1 + 96);
    v54 = *(id *)(a1 + 40);
    v18 = v54;
    if (v53 == 1)
    {
      objc_msgSend(v54, "bottomAnchor");
      v55 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v53)
        goto LABEL_45;
      objc_msgSend(v54, "trailingAnchor");
      v55 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v55;
LABEL_45:

    v56 = *(_QWORD *)(a1 + 96);
    v57 = v7;
    v58 = v57;
    if (v56 == 1)
    {
      objc_msgSend(v57, "topAnchor");
      v59 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v56)
      {
LABEL_50:

        objc_msgSend(v23, "constraintEqualToAnchor:", v18);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addObject:", v11);
        goto LABEL_85;
      }
      objc_msgSend(v57, "leadingAnchor");
      v59 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v59;
    goto LABEL_50;
  }
  v83 = (void *)v6;
  objc_msgSend(v84, "layoutItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3 - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v12 = objc_alloc_init(UILayoutGuide);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(void **)(a1 + 32);
  v16 = *(void **)(a1 + 96);
  v17 = v10;
  v18 = v17;
  if (v16 == (void *)1)
  {
    objc_msgSend(v17, "bottomAnchor");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v16)
      goto LABEL_10;
    objc_msgSend(v17, "trailingAnchor");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v19;
LABEL_10:

  v25 = *(_QWORD *)(a1 + 96);
  v26 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v27 = v26;
  if (v25 == 1)
  {
    objc_msgSend(v26, "topAnchor");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v25)
      goto LABEL_15;
    objc_msgSend(v26, "leadingAnchor");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v28;
LABEL_15:

  objc_msgSend(v10, "constraintEqualToAnchor:", v16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v29);

  v30 = *(void **)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 96);
  v32 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v33 = v32;
  if (v31 == 1)
  {
    objc_msgSend(v32, "bottomAnchor");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v31)
      goto LABEL_20;
    objc_msgSend(v32, "trailingAnchor");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v34;
LABEL_20:

  v35 = *(_QWORD *)(a1 + 96);
  v36 = v8;
  v23 = v36;
  if (v35 == 1)
  {
    objc_msgSend(v36, "topAnchor");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v35)
      goto LABEL_25;
    objc_msgSend(v36, "leadingAnchor");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v37;
LABEL_25:

  objc_msgSend(v10, "constraintEqualToAnchor:", v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v38);

  if (*(double *)(*(_QWORD *)(a1 + 64) + 8) != -1.0)
  {
    v10 = *(void **)(a1 + 32);
    v43 = *(_QWORD *)(a1 + 96);
    v44 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v45 = v44;
    if (v43 == 1)
    {
      objc_msgSend(v44, "heightAnchor");
      v46 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v43)
      {
LABEL_58:

        objc_msgSend(v30, "constraintEqualToConstant:", *(double *)(*(_QWORD *)(a1 + 64) + 8));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v41);
LABEL_62:

        goto LABEL_63;
      }
      objc_msgSend(v44, "widthAnchor");
      v46 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v46;
    goto LABEL_58;
  }
  if (v11)
  {
    v10 = *(void **)(a1 + 32);
    v39 = *(_QWORD *)(a1 + 96);
    v40 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v41 = v40;
    if (v39 == 1)
    {
      objc_msgSend(v40, "heightAnchor");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v39)
        goto LABEL_53;
      objc_msgSend(v40, "widthAnchor");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v42;
LABEL_53:

    v60 = *(_QWORD *)(a1 + 96);
    v61 = v11;
    v62 = v61;
    if (v60 == 1)
    {
      objc_msgSend(v61, "heightAnchor");
      v63 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v60)
      {
LABEL_61:

        objc_msgSend(v30, "constraintEqualToAnchor:", v41);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v64);

        goto LABEL_62;
      }
      objc_msgSend(v61, "widthAnchor");
      v63 = objc_claimAutoreleasedReturnValue();
    }
    v41 = (void *)v63;
    goto LABEL_61;
  }
LABEL_63:
  objc_msgSend(*(id *)(a1 + 72), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  if (*(_QWORD *)(a1 + 104) - 1 == a3)
  {
    v65 = *(void **)(a1 + 32);
    v66 = *(_QWORD *)(a1 + 96);
    v67 = v23;
    v23 = v67;
    if (v66 == 1)
    {
      objc_msgSend(v67, "bottomAnchor");
      v68 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v66)
        goto LABEL_70;
      objc_msgSend(v67, "trailingAnchor");
      v68 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v68;
LABEL_70:

    v69 = *(_QWORD *)(a1 + 96);
    v70 = *(id *)(a1 + 80);
    v71 = v70;
    if (v69 == 1)
    {
      objc_msgSend(v70, "topAnchor");
      v72 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v69)
        goto LABEL_75;
      objc_msgSend(v70, "leadingAnchor");
      v72 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v72;
LABEL_75:

    objc_msgSend(v30, "constraintEqualToAnchor:", v10);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v73);

    v74 = *(void **)(a1 + 32);
    v75 = *(_QWORD *)(a1 + 96);
    v76 = *(id *)(a1 + 80);
    v77 = v76;
    if (v75 == 1)
    {
      objc_msgSend(v76, "bottomAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v83;
    }
    else
    {
      v7 = v83;
      if (!v75)
      {
        objc_msgSend(v76, "trailingAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    v78 = *(_QWORD *)(a1 + 96);
    v79 = *(id *)(a1 + 48);
    v80 = v79;
    if (v78 == 1)
    {
      objc_msgSend(v79, "bottomAnchor");
      v81 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v78)
      {
LABEL_84:

        objc_msgSend(v30, "constraintEqualToAnchor:", a1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v82);

        goto LABEL_85;
      }
      objc_msgSend(v79, "trailingAnchor");
      v81 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v81;
    goto LABEL_84;
  }
  v7 = v83;
LABEL_85:

}

@end
