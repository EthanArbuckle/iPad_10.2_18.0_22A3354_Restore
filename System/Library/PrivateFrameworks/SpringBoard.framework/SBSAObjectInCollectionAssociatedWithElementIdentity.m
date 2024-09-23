@implementation SBSAObjectInCollectionAssociatedWithElementIdentity

void __SBSAObjectInCollectionAssociatedWithElementIdentity_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((SAElementIdentityEqualToIdentity() & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "associatedSystemApertureElementIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = SAElementIdentityEqualToIdentity();

    if (v9)
    {
LABEL_7:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
LABEL_8:

}

@end
