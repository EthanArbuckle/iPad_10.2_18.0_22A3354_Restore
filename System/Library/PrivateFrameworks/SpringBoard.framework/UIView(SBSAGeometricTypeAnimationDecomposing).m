@implementation UIView(SBSAGeometricTypeAnimationDecomposing)

- (id)_independentlyAnimatableMemberKeyPathsForPropertyKeyPath:()SBSAGeometricTypeAnimationDecomposing
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= 2
    && (objc_opt_self(),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v5, "subarrayWithRange:", 1, v6 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_independentlyAnimatableMemberKeyPathsForPropertyKeyPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_independentlyAnimatableMemberKeyPathsForProperty:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_independentlyAnimatableMemberKeyPathsForProperty:()SBSAGeometricTypeAnimationDecomposing
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (_independentlyAnimatableMemberKeyPathsForProperty____onceToken_10 != -1)
    dispatch_once(&_independentlyAnimatableMemberKeyPathsForProperty____onceToken_10, &__block_literal_global_11);
  if (BSEqualObjects())
  {
    v5 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____centerMembers;
  }
  else
  {
    if (!BSEqualObjects())
    {
      v9.receiver = a1;
      v9.super_class = (Class)UIView_0;
      objc_msgSendSuper2(&v9, sel__independentlyAnimatableMemberKeyPathsForProperty_, v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v5 = (void *)_independentlyAnimatableMemberKeyPathsForProperty____boundsMembers;
  }
  v6 = v5;
LABEL_9:
  v7 = v6;

  return v7;
}

- (void)_setValue:()SBSAGeometricTypeAnimationDecomposing byUpdatingMemberKeypaths:forKeyPath:
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
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
  int v51;
  double v52;
  id v53;

  v53 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 >= 2
    && (objc_opt_self(),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v11, "subarrayWithRange:", 1, v12 - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("."));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_setValue:byUpdatingMemberKeypaths:forKeyPath:", v53, v9, v18);
  }
  else
  {
    if (BSEqualObjects())
    {
      objc_msgSend(a1, "valueForKeyPath:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v53;
      v21 = v9;
      objc_msgSend(v19, "bs_CGPointValue");
      v23 = v22;
      v25 = v24;
      objc_msgSend(v20, "bs_CGPointValue");
      v27 = v26;
      v29 = v28;

      if (objc_msgSend(v21, "containsObject:", CFSTR("x")))
        v23 = v27;
      v30 = objc_msgSend(v21, "containsObject:", CFSTR("y"));

      if (v30)
        v31 = v29;
      else
        v31 = v25;
      v32 = (void *)objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", v23, v31);
    }
    else
    {
      if (!BSEqualObjects())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+SBSAGeometricTypeAnimationDecomposing.m"), 92, CFSTR("Attempting to update members of unsupported keypath"));
        goto LABEL_24;
      }
      objc_msgSend(a1, "valueForKeyPath:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v53;
      v34 = v9;
      objc_msgSend(v19, "bs_CGRectValue");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      objc_msgSend(v33, "bs_CGRectValue");
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v50 = v49;

      if (objc_msgSend(v34, "containsObject:", CFSTR("origin.x")))
        v36 = v44;
      if (objc_msgSend(v34, "containsObject:", CFSTR("origin.y")))
        v38 = v46;
      if (objc_msgSend(v34, "containsObject:", CFSTR("size.width")))
        v40 = v48;
      v51 = objc_msgSend(v34, "containsObject:", CFSTR("size.height"));

      if (v51)
        v52 = v50;
      else
        v52 = v42;
      v32 = (void *)objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v36, v38, v40, v52);
    }
    v18 = v32;

    objc_msgSend(a1, "setValue:forKeyPath:", v18, v10);
  }
LABEL_24:

}

@end
