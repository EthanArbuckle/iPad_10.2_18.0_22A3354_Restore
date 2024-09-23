@implementation PXTilingControllerDefaultComposition

- (void)updateComposition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double y;
  double x;
  double height;
  double width;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
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
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGRect v71;
  _BYTE v72[32];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v78 = *MEMORY[0x1E0C80C00];
  -[PXTilingControllerComposition input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingControllerComposition output](self, "output");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingControllerDefaultComposition tilingControllers](self, "tilingControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referenceSize");
  v63 = v7;
  v64 = v6;
  objc_msgSend(v3, "contentInset");
  v61 = v9;
  v62 = v8;
  v59 = v11;
  v60 = v10;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v74;
    *(double *)&v72[16] = width;
    *(double *)&v72[24] = height;
    *(double *)v72 = x;
    *(double *)&v72[8] = y;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        v71.origin.x = x;
        v71.origin.y = y;
        if (*(_QWORD *)v74 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v4, "setReferenceSize:contentInset:forTilingController:", v22, v64, v63, v62, v61, v60, v59);
        objc_msgSend(v3, "contentBoundsForTilingController:", v22);
        v69 = v24;
        v70 = v23;
        v67 = v26;
        v68 = v25;
        objc_msgSend(v3, "scrollBoundsForTilingController:", v22);
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;
        objc_msgSend(v3, "preferredOriginForTilingController:", v22);
        v71.size.width = width;
        v71.size.height = height;
        if (PXPointIsNull())
          objc_msgSend(v3, "originForTilingController:", v22);
        objc_msgSend(v22, "scrollController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "visibleRect");
        v65 = v37;
        v66 = v36;

        PXPointSubtract();
        v39 = v38;
        v41 = v40;
        v79.origin.x = v28;
        v79.origin.y = v30;
        v79.size.width = v32;
        v79.size.height = v34;
        if (v39 >= CGRectGetMinX(v79))
        {
          v81.origin.x = v28;
          v81.origin.y = v30;
          v81.size.width = v32;
          v81.size.height = v34;
          if (v66 + v39 > CGRectGetMaxX(v81))
          {
            v82.origin.x = v28;
            v82.origin.y = v30;
            v82.size.width = v32;
            v82.size.height = v34;
            CGRectGetMinX(v82);
            v83.origin.x = v28;
            v83.origin.y = v30;
            v83.size.width = v32;
            v83.size.height = v34;
            CGRectGetMaxX(v83);
          }
        }
        else
        {
          v80.origin.x = v28;
          v80.origin.y = v30;
          v80.size.width = v32;
          v80.size.height = v34;
          CGRectGetMinX(v80);
        }
        v84.origin.x = v28;
        v84.origin.y = v30;
        v84.size.width = v32;
        v84.size.height = v34;
        if (v41 >= CGRectGetMinY(v84))
        {
          v86.origin.x = v28;
          v86.origin.y = v30;
          v86.size.width = v32;
          v86.size.height = v34;
          if (v65 + v41 > CGRectGetMaxY(v86))
          {
            v87.origin.x = v28;
            v87.origin.y = v30;
            v87.size.width = v32;
            v87.size.height = v34;
            CGRectGetMinY(v87);
            v88.origin.x = v28;
            v88.origin.y = v30;
            v88.size.width = v32;
            v88.size.height = v34;
            CGRectGetMaxY(v88);
          }
        }
        else
        {
          v85.origin.x = v28;
          v85.origin.y = v30;
          v85.size.width = v32;
          v85.size.height = v34;
          CGRectGetMinY(v85);
        }
        PXPointSubtract();
        objc_msgSend(v4, "setOrigin:forTilingController:", v22);
        if (!v19)
        {
          objc_msgSend(v3, "scrollInfoForTilingController:", v22);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "convertScrollInfo:fromTilingController:", v42, v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v3, "convertRect:fromTilingController:", v22, v70, v69, v68, v67);
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;
        objc_msgSend(v3, "convertRect:fromTilingController:", v22, v28, v30, v32, v34);
        v52 = v51;
        v54 = v53;
        v56 = v55;
        v58 = v57;
        v90.origin.x = v44;
        v90.origin.y = v46;
        v90.size.width = v48;
        v90.size.height = v50;
        *(CGRect *)v72 = CGRectUnion(*(CGRect *)v72, v90);
        v91.origin.x = v52;
        v91.origin.y = v54;
        v91.size.width = v56;
        v91.size.height = v58;
        v89 = CGRectUnion(v71, v91);
        x = v89.origin.x;
        y = v89.origin.y;
        width = v89.size.width;
        height = v89.size.height;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
    *(double *)&v72[16] = width;
    *(double *)&v72[24] = height;
    *(double *)v72 = x;
    *(double *)&v72[8] = y;
  }

  objc_msgSend(v4, "setContentBounds:scrollBounds:scrollInfo:", v19, *(double *)v72, *(double *)&v72[8], *(double *)&v72[16], *(double *)&v72[24], x, y, width, height);
}

- (NSSet)tilingControllers
{
  return self->_tilingControllers;
}

- (void)setTilingControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilingControllers, 0);
}

@end
