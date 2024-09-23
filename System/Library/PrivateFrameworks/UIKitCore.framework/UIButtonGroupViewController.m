@implementation UIButtonGroupViewController

void __78___UIButtonGroupViewController_initWithBarButtonItemGroups_overLightKeyboard___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(_QWORD);
  id WeakRetained;
  void *v8;
  _BYTE *v9;
  char v10;
  void (**v11)(_QWORD);
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v12, "barButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buttonGroup");
    v9 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9[24];

      v11 = v6;
      if ((v10 & 4) != 0)
      {
        v6[2](v6);
        v11 = 0;
      }
    }
    else
    {

      v11 = v6;
    }
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v11);
  }

}

@end
