@implementation VLFCalloutVisibilityHelper

+ (void)updateVLFBannerVisibilityWithChromeViewController:(id)a3 floatingControlsViewController:(id)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  CGFloat x;
  double v75;
  CGFloat y;
  double v77;
  CGFloat width;
  double v79;
  CGFloat height;
  _BOOL4 v81;
  _BOOL4 v82;
  uint64_t v83;
  void *v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  id v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v93 = a3;
  v5 = a4;
  v6 = +[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported");
  if (v5 && v93 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "userLocationView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vlfPuckModeCircleView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "userLocationView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vlfPuckModeCircleView"));
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "view"));
    objc_msgSend(v8, "convertRect:toView:", v19, v12, v14, v16, v18);
    v91 = v21;
    v92 = v20;
    v89 = v23;
    v90 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "userLocationView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_calloutView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "userLocationView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_calloutView"));
    objc_msgSend(v27, "bounds");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "view"));
    objc_msgSend(v25, "convertRect:toView:", v36, v29, v31, v33, v35);
    v87 = v38;
    v88 = v37;
    v85 = v40;
    v86 = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v5, "floatingButtonsFrame");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "view"));
    objc_msgSend(v41, "convertRect:toView:", v50, v43, v45, v47, v49);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "_currentContainerViewController"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "currentViewController"));
    v61 = v60;
    if (v60)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "view"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "view"));
      objc_msgSend(v63, "bounds");
      v65 = v64;
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "view"));
      objc_msgSend(v62, "convertRect:toView:", v72, v65, v67, v69, v71);
      x = v73;
      y = v75;
      width = v77;
      height = v79;

    }
    else
    {
      x = CGRectNull.origin.x;
      y = CGRectNull.origin.y;
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
    }
    v94.origin.y = v91;
    v94.origin.x = v92;
    v94.size.height = v89;
    v94.size.width = v90;
    v100.origin.x = v52;
    v100.origin.y = v54;
    v100.size.width = v56;
    v100.size.height = v58;
    if (CGRectIntersectsRect(v94, v100))
    {
      v81 = 1;
    }
    else
    {
      v95.origin.x = x;
      v95.origin.y = y;
      v95.size.width = width;
      v95.size.height = height;
      if (CGRectIsNull(v95))
      {
        v81 = 0;
      }
      else
      {
        v96.origin.y = v91;
        v96.origin.x = v92;
        v96.size.height = v89;
        v96.size.width = v90;
        v101.origin.x = x;
        v101.origin.y = y;
        v101.size.width = width;
        v101.size.height = height;
        v81 = CGRectIntersectsRect(v96, v101);
      }
    }
    v97.origin.y = v87;
    v97.origin.x = v88;
    v97.size.height = v85;
    v97.size.width = v86;
    v102.origin.x = v52;
    v102.origin.y = v54;
    v102.size.width = v56;
    v102.size.height = v58;
    if (CGRectIntersectsRect(v97, v102))
    {
      v82 = 1;
    }
    else
    {
      v98.origin.x = x;
      v98.origin.y = y;
      v98.size.width = width;
      v98.size.height = height;
      if (CGRectIsNull(v98))
      {
        v82 = 0;
      }
      else
      {
        v99.origin.y = v87;
        v99.origin.x = v88;
        v99.size.height = v85;
        v99.size.width = v86;
        v103.origin.x = x;
        v103.origin.y = y;
        v103.size.width = width;
        v103.size.height = height;
        v82 = CGRectIntersectsRect(v99, v103);
      }
    }
    v83 = v81 | v82;
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "userLocationView"));
    objc_msgSend(v84, "setVlfOverlappingFloatingControls:", v83);

  }
}

@end
