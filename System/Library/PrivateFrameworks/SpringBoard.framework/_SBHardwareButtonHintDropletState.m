@implementation _SBHardwareButtonHintDropletState

- (uint64_t)setPresentedStage:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 64) = a2;
  return result;
}

- (void)setLayoutCallback:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
}

- (id)initWithButton:(void *)a3 dropletContextView:(void *)a4 contentView:(void *)a5 groupState:
{
  id v9;
  id v10;
  id v11;
  id *v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)_SBHardwareButtonHintDropletState;
    v12 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a5);
      a1[1] = a2;
      a1[8] = (id)1;
      if (a2 != (void *)10)
      {
        objc_msgSend(v9, "addContainerWithContentView:", v10);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = a1[3];
        a1[3] = (id)v13;

      }
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (_QWORD)stage
{
  _QWORD *v1;

  if (result)
  {
    if (result[7])
    {
      v1 = (_QWORD *)result[2];
      if (!v1 || !v1[7] && !v1[6] && !v1[5])
        v1 = result;
      return (_QWORD *)v1[8];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (_QWORD)isIdle
{
  if (result)
  {
    if (result[7] || result[6])
      return 0;
    else
      return (_QWORD *)(result[5] == 0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAssertion, 0);
  objc_storeStrong((id *)&self->_hintView, 0);
  objc_storeStrong(&self->_layoutCallback, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dropletContainerView, 0);
  objc_storeStrong((id *)&self->_groupState, 0);
}

@end
