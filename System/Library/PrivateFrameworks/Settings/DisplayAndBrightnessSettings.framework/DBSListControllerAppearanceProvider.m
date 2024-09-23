@implementation DBSListControllerAppearanceProvider

- (void)listController:(id)a3 updateSectionContentInsetAnimated:(BOOL)a4 isRegularWidth:(BOOL)a5 contentInsetInitialized:(BOOL)a6 contentInsetInitializedApplicator:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void (**v12)(_QWORD);
  void *v13;
  id v14;
  void *v15;
  char v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v12 = (void (**)(_QWORD))a7;
  v13 = (void *)MEMORY[0x24BEBD538];
  v14 = a3;
  objc_msgSend(v13, "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sf_isiPad");

  if ((v16 & 1) != 0 || v8)
  {
    v26.receiver = self;
    v26.super_class = (Class)DBSListControllerAppearanceProvider;
    -[PSListControllerDefaultAppearanceProvider listController:updateSectionContentInsetAnimated:isRegularWidth:contentInsetInitialized:contentInsetInitializedApplicator:](&v26, sel_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator_, v14, v9, v8, v7, v12);

  }
  else
  {
    v17 = *MEMORY[0x24BEBE770];
    objc_msgSend(v14, "table");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v7)
    {
      objc_msgSend(v18, "_setSectionContentInset:", v17, v17, v17, v17);
    }
    else
    {
      v19 = (void *)MEMORY[0x24BEBDB00];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __161__DBSListControllerAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke;
      v20[3] = &unk_24F025E98;
      v21 = v18;
      v22 = v17;
      v23 = v17;
      v24 = v17;
      v25 = v17;
      objc_msgSend(v19, "performWithoutAnimation:", v20);
      v12[2](v12);

    }
  }

}

uint64_t __161__DBSListControllerAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSectionContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
