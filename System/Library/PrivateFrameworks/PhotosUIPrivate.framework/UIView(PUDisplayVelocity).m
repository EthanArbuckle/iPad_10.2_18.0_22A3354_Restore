@implementation UIView(PUDisplayVelocity)

+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:
{
  id v29;
  __int128 v30;
  id v31;
  _OWORD v35[3];
  _QWORD v36[4];
  id v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;

  v29 = a11;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __147__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke;
  v36[3] = &unk_1E589E198;
  v37 = v29;
  v38 = a8;
  v39 = a9;
  v40 = a17;
  v41 = a13;
  v30 = a12[1];
  v35[0] = *a12;
  v35[1] = v30;
  v35[2] = a12[2];
  v31 = v29;
  objc_msgSend(a1, "_pu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v31, v35, v36, a14, a2, a3, a4, a5, a6, a7, a18, a19, a20);

}

+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:
{
  id v28;
  __int128 v29;
  id v30;
  _OWORD v32[3];
  _QWORD v33[4];
  id v34;
  double v35;
  uint64_t v36;

  v28 = a10;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __139__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke;
  v33[3] = &unk_1E589E1C0;
  v34 = v28;
  v35 = a8;
  v36 = a12;
  v29 = a11[1];
  v32[0] = *a11;
  v32[1] = v29;
  v32[2] = a11[2];
  v30 = v28;
  objc_msgSend(a1, "_pu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v30, v32, v33, a13, a2, a3, a4, a5, a6, a7, a16, a17, a18);

}

+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:
{
  id v30;
  __int128 v31;
  id v32;
  _OWORD v36[3];
  _QWORD v37[4];
  id v38;
  double v39;
  double v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;

  v30 = a11;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __158__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_completion___block_invoke;
  v37[3] = &unk_1E589E1E8;
  v38 = v30;
  v39 = a8;
  v40 = a9;
  v41 = a13;
  v42 = a17;
  v43 = a18;
  v31 = a12[1];
  v36[0] = *a12;
  v36[1] = v31;
  v36[2] = a12[2];
  v32 = v30;
  objc_msgSend(a1, "_pu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v32, v36, v37, a14, a2, a3, a4, a5, a6, a7, a19, a20, a21);

}

+ (void)_pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:
{
  id v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  double v42;
  double Width;
  double v44;
  double Height;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  NSObject *v53;
  id v54;
  __int128 v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  int v60;
  char v61;
  id v62;
  NSObject *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  __int128 v73;
  _QWORD v74[4];
  NSObject *v75;
  _QWORD *v76;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  double v80;
  double v81;
  double v82;
  _QWORD v83[4];
  NSObject *v84;
  _QWORD *v85;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  double v89;
  double v90;
  double v91;
  _QWORD v92[4];
  NSObject *v93;
  _QWORD *v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  __int128 v104;
  double v105;
  double v106;
  double v107;
  __int128 v108;
  CGAffineTransform t1;
  _QWORD v110[4];
  NSObject *v111;
  _QWORD *v112;
  _QWORD v113[4];
  id v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  _QWORD v119[4];
  NSObject *v120;
  _QWORD *v121;
  _QWORD v122[4];
  id v123;
  double v124;
  double v125;
  _QWORD v126[4];
  NSObject *v127;
  _QWORD *v128;
  _QWORD v129[4];
  id v130;
  double v131;
  double v132;
  _QWORD block[4];
  id v134;
  _QWORD *v135;
  _QWORD v136[3];
  char v137;
  CGAffineTransform v138;
  CGAffineTransform t2;
  uint64_t v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  v140 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = a5;
  v30 = a6;
  if (v28)
  {
    if (v29)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUDisplayVelocity.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

    if (v29)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUDisplayVelocity.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("springAnimation != NULL"));

LABEL_3:
  objc_msgSend(v28, "center");
  v32 = v31;
  v34 = v33;
  objc_msgSend(v28, "bounds");
  v70 = v36;
  v71 = v35;
  v68 = v38;
  v69 = v37;
  memset(&v138, 0, sizeof(v138));
  if (v28)
    objc_msgSend(v28, "transform");
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x2020000000;
  v137 = 1;
  v39 = dispatch_group_create();
  dispatch_group_enter(v39);
  v40 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke;
  block[3] = &unk_1E58AA720;
  v41 = v30;
  v134 = v41;
  v135 = v136;
  dispatch_group_notify(v39, MEMORY[0x1E0C80D38], block);
  if (a7 == v32)
  {
    a7 = v32;
    v42 = a8;
  }
  else
  {
    dispatch_group_enter(v39);
    v129[0] = v40;
    v129[1] = 3221225472;
    v129[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2;
    v129[3] = &unk_1E58A5BB0;
    v130 = v28;
    v131 = a7;
    v132 = v34;
    v126[0] = v40;
    v126[1] = 3221225472;
    v126[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3;
    v126[3] = &unk_1E58A9168;
    v128 = v136;
    v127 = v39;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v129, v126, a15 / (a7 - v32));

    v42 = a8;
  }
  if (v42 != v34)
  {
    dispatch_group_enter(v39);
    v122[0] = v40;
    v122[1] = 3221225472;
    v122[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
    v122[3] = &unk_1E58A5BB0;
    v123 = v28;
    v124 = a7;
    v125 = v42;
    v119[0] = v40;
    v119[1] = 3221225472;
    v119[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5;
    v119[3] = &unk_1E58A9168;
    v121 = v136;
    v120 = v39;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v122, v119, a16 / (v42 - v34));

  }
  v141.origin.x = a9;
  v141.origin.y = a10;
  v141.size.width = a11;
  v141.size.height = a12;
  v146.origin.y = v70;
  v146.origin.x = v71;
  v146.size.height = v68;
  v146.size.width = v69;
  if (!CGRectEqualToRect(v141, v146))
  {
    v142.origin.x = a9;
    v142.origin.y = a10;
    v142.size.width = a11;
    v142.size.height = a12;
    Width = CGRectGetWidth(v142);
    v143.origin.y = v70;
    v143.origin.x = v71;
    v143.size.height = v68;
    v143.size.width = v69;
    v44 = CGRectGetWidth(v143);
    v144.origin.x = a9;
    v144.origin.y = a10;
    v144.size.width = a11;
    v144.size.height = a12;
    Height = CGRectGetHeight(v144);
    v145.origin.y = v70;
    v145.origin.x = v71;
    v145.size.height = v68;
    v145.size.width = v69;
    v46 = Height / CGRectGetHeight(v145);
    v47 = 0.0;
    v48 = 0.0;
    if (Width / v44 != 1.0)
      v48 = a17 / (Width / v44 + -1.0);
    if (v46 != 1.0)
      v47 = a17 / (v46 + -1.0);
    v49 = (v48 + v47) * 0.5;
    dispatch_group_enter(v39);
    v113[0] = v40;
    v113[1] = 3221225472;
    v113[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6;
    v113[3] = &unk_1E58AACA0;
    v114 = v28;
    v115 = a9;
    v116 = a10;
    v117 = a11;
    v118 = a12;
    v110[0] = v40;
    v110[1] = 3221225472;
    v110[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7;
    v110[3] = &unk_1E58A9168;
    v112 = v136;
    v111 = v39;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v113, v110, v49);

  }
  v50 = a4[1];
  *(_OWORD *)&t1.a = *a4;
  *(_OWORD *)&t1.c = v50;
  *(_OWORD *)&t1.tx = a4[2];
  t2 = v138;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v51 = *MEMORY[0x1E0C9D538];
    v107 = 0.0;
    v105 = 0.0;
    v106 = 0.0;
    v73 = v51;
    v108 = v51;
    t1 = v138;
    PUDecomposeTransform((uint64_t)&t1, &v108, &v107, &v106, &v105);
    v104 = v73;
    v102 = 0.0;
    v103 = 0.0;
    v101 = 0.0;
    v52 = a4[1];
    *(_OWORD *)&t1.a = *a4;
    *(_OWORD *)&t1.c = v52;
    *(_OWORD *)&t1.tx = a4[2];
    PUDecomposeTransform((uint64_t)&t1, &v104, &v103, &v102, &v101);
    if (!PXFloatApproximatelyEqualToFloat() || (PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      PLUIGetLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        t1 = v138;
        NSStringFromCGAffineTransform(&t1);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        v55 = a4[1];
        *(_OWORD *)&t1.a = *a4;
        *(_OWORD *)&t1.c = v55;
        *(_OWORD *)&t1.tx = a4[2];
        NSStringFromCGAffineTransform(&t1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(t2.a) = 138412546;
        *(_QWORD *)((char *)&t2.a + 4) = v54;
        WORD2(t2.b) = 2112;
        *(_QWORD *)((char *)&t2.b + 6) = v56;
        _os_log_impl(&dword_1AAB61000, v53, OS_LOG_TYPE_DEFAULT, "animation of translational transforms is not supported (%@ => %@)", (uint8_t *)&t2, 0x16u);

      }
    }
    if (v103 != v107 || v102 != v106)
    {
      v57 = v102 / v106;
      v58 = 0.0;
      v59 = 0.0;
      if (v103 / v107 != 1.0)
        v59 = a17 / (v103 / v107 + -1.0);
      if (v57 != 1.0)
        v58 = a17 / (v57 + -1.0);
      v60 = PXFloatApproximatelyEqualToFloat();
      v61 = v60;
      v107 = v103;
      if (v60)
        v106 = v102;
      dispatch_group_enter(v39);
      v95[0] = v40;
      v95[1] = 3221225472;
      v95[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_15;
      v95[3] = &unk_1E589E210;
      v62 = v28;
      v96 = v62;
      v97 = v108;
      v98 = v107;
      v99 = v106;
      v100 = v105;
      v92[0] = v40;
      v92[1] = 3221225472;
      v92[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_16;
      v92[3] = &unk_1E58A9168;
      v94 = v136;
      v63 = v39;
      v93 = v63;
      (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v95, v92, v59);
      if ((v61 & 1) == 0)
      {
        v106 = v102;
        dispatch_group_enter(v63);
        v86[0] = v40;
        v86[1] = 3221225472;
        v86[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_17;
        v86[3] = &unk_1E589E210;
        v87 = v62;
        v88 = v108;
        v89 = v107;
        v90 = v106;
        v91 = v105;
        v83[0] = v40;
        v83[1] = 3221225472;
        v83[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_18;
        v83[3] = &unk_1E58A9168;
        v85 = v136;
        v84 = v63;
        (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v86, v83, v58);

      }
    }
    if (v101 != v105)
    {
      v64 = v101 - v105;
      v105 = v101;
      v65 = a18 / v64;
      dispatch_group_enter(v39);
      v77[0] = v40;
      v77[1] = 3221225472;
      v77[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_19;
      v77[3] = &unk_1E589E210;
      v78 = v28;
      v79 = v108;
      v80 = v107;
      v81 = v106;
      v82 = v105;
      v74[0] = v40;
      v74[1] = 3221225472;
      v74[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_20;
      v74[3] = &unk_1E58A9168;
      v76 = v136;
      v75 = v39;
      (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v77, v74, v65);

    }
  }
  dispatch_group_leave(v39);

  _Block_object_dispose(v136, 8);
}

@end
