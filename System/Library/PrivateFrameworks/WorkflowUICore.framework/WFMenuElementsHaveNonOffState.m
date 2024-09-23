@implementation WFMenuElementsHaveNonOffState

BOOL __WFMenuElementsHaveNonOffState_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v2 = a2;
  if (!v2)
  {
    v5 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if ((objc_msgSend(v4, "shouldCollapse") & 1) == 0)
      {
        objc_msgSend(v4, "menuElements");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "if_firstObjectPassingTest:", &__block_literal_global_634);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v7 != 0;

LABEL_15:
        goto LABEL_16;
      }
    }
    else
    {

      v5 = 0;
    }
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v6, "mayContainSelectedItem") & 1) != 0)
      {
        v3 = 1;
LABEL_14:
        v4 = v5;
        goto LABEL_15;
      }
LABEL_13:
      v3 = 0;
      goto LABEL_14;
    }
LABEL_12:

    v6 = 0;
    goto LABEL_13;
  }
  v3 = objc_msgSend(v2, "state") != 0;
  v4 = v2;
LABEL_16:

  return v3;
}

@end
