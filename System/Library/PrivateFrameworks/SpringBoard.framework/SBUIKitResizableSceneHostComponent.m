@implementation SBUIKitResizableSceneHostComponent

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  _QWORD v9[8];
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    if (!CGRectIsEmpty(v10))
    {
      -[FBSSceneComponent hostScene](self, "hostScene");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__SBUIKitResizableSceneHostComponent_setFrame___block_invoke;
      v9[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
      *(CGFloat *)&v9[4] = x;
      *(CGFloat *)&v9[5] = y;
      *(CGFloat *)&v9[6] = width;
      *(CGFloat *)&v9[7] = height;
      objc_msgSend(v8, "updateSettingsWithBlock:", v9);

    }
  }
}

uint64_t __47__SBUIKitResizableSceneHostComponent_setFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)resizableContentViewController:(id)a3 didUpdateToBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", 0, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SBUIKitResizableSceneHostComponent setFrame:](self, "setFrame:", v11, v13, v15, v17);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
