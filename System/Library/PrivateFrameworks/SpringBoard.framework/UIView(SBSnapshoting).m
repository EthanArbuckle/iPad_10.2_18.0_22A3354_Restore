@implementation UIView(SBSnapshoting)

- (id)sb_generateSnapshotContentsSynchronously
{
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__127;
  v8 = __Block_byref_object_dispose__127;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__UIView_SBSnapshoting__sb_generateSnapshotContentsSynchronously__block_invoke;
  v3[3] = &unk_1E8EC04E0;
  v3[4] = &v4;
  objc_msgSend(a1, "_generateSnapshotOnQueue:completionHandler:", 0, v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (void)_generateSnapshotOnQueue:()SBSnapshoting completionHandler:
{
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  void *v37;
  _QWORD v38[4];
  void (**v39)(_QWORD);
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CATransform3D v51;
  int v52;
  CATransform3D v53;
  CGRect v54;
  CGRect v55;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_contextId");

  objc_msgSend(MEMORY[0x1E0CD2720], "allContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v53.m11 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v53.m12 = 3221225472;
  *(_QWORD *)&v53.m13 = __SBCAContextForContextID_block_invoke;
  *(_QWORD *)&v53.m14 = &__block_descriptor_36_e19_B16__0__CAContext_8l;
  LODWORD(v53.m21) = v9;
  objc_msgSend(v10, "bs_firstObjectPassingTest:", &v53);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;
  objc_msgSend(v13, "presentationLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "presentationLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    objc_msgSend(a1, "bounds");
    v20 = v27;
    v22 = v28;
    v24 = v29;
    v26 = v30;
  }

  v54.origin.x = v20;
  v54.origin.y = v22;
  v54.size.width = v24;
  v54.size.height = v26;
  v31 = v16 * CGRectGetWidth(v54);
  v55.origin.x = v20;
  v55.origin.y = v22;
  v55.size.width = v24;
  v55.size.height = v26;
  v32 = v16 * CGRectGetHeight(v55);
  memset(&v53, 0, sizeof(v53));
  CATransform3DMakeScale(&v53, v16, v16, 1.0);
  v40[0] = v11;
  v40[1] = 3221225472;
  v40[2] = __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke;
  v40[3] = &unk_1E8EC0508;
  v33 = v12;
  v41 = v33;
  v44 = v31;
  v45 = v32;
  v52 = v9;
  v34 = v13;
  v42 = v34;
  v46 = v20;
  v47 = v22;
  v48 = v24;
  v49 = v26;
  v50 = v16;
  v51 = v53;
  v35 = v7;
  v43 = v35;
  v36 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v40);
  v37 = v36;
  if (v6)
  {
    v38[0] = v11;
    v38[1] = 3221225472;
    v38[2] = __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke_2;
    v38[3] = &unk_1E8E9E8D0;
    v39 = v36;
    dispatch_async(v6, v38);

  }
  else
  {
    v36[2](v36);
  }

}

@end
